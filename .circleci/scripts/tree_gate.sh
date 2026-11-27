#!/usr/bin/env bash
# Skip a job on main when the same job already passed on the same git tree.
#
#   tree_gate.sh key [REPO]               # write the cache key file
#   tree_gate.sh mark [REPO]              # PR run, after every step passed
#   tree_gate.sh halt-if-verified [REPO]  # main run, after restore_cache
#   tree_gate.sh --self-test              # throwaway repository, no network
#
# WHY: the `ci-required-checks` ruleset requires a PR to be up to date before
# it merges, and main only squash-merges, so a squash commit on main has the
# same tree as the PR head that was just tested. main bought the run twice.
#
# The key is "<tree> <job> <node>/<total>", so one green shard of a parallel
# job can never mark the other shards as verified.
#
# Fails OPEN: anything that cannot be measured runs the job on main, and never
# turns a passing PR job red.
set -euo pipefail

DIR=.tree-gate # relative: restore_cache puts it back under the working dir
KEY="$DIR/key"
MARK="$DIR/verified"
UNMEASURABLE=unmeasurable

write_key() {
    local repo="$1" tree
    mkdir -p "$DIR"
    if ! tree="$(git -C "$repo" rev-parse --verify -q 'HEAD^{tree}')" || [ -z "${CIRCLE_JOB:-}" ]; then
        echo "$UNMEASURABLE" >"$KEY"
        return 1
    fi
    echo "$tree $CIRCLE_JOB ${CIRCLE_NODE_INDEX:-0}/${CIRCLE_NODE_TOTAL:-1}" >"$KEY"
}

mark() {
    if ! write_key "$1"; then
        rm -f "$MARK"
        echo "tree_gate: cannot measure this tree; not recording" >&2
        return 0
    fi
    cp "$KEY" "$MARK"
    echo "tree_gate: recorded as passed: $(cat "$MARK")"
}

halt_if_verified() {
    if ! write_key "$1"; then
        echo "tree_gate: cannot measure this tree; running the job"
    elif [ -f "$MARK" ] && [ "$(cat "$MARK")" = "$(cat "$KEY")" ]; then
        echo "tree_gate: HALT, this job already passed on this tree: $(cat "$KEY")"
        circleci-agent step halt
    else
        echo "tree_gate: no passing record for $(cat "$KEY"); running the job"
    fi
}

# --- self-test -------------------------------------------------------------
self_test() {
    local script tmp failures=0
    script="$(cd "$(dirname "$0")" && pwd)/$(basename "$0")"
    tmp="$(mktemp -d)"
    mkdir -p "$tmp/bin" "$tmp/repo" "$tmp/not-a-repo"
    printf '#!/bin/sh\necho "$*" >> "%s/halted"\n' "$tmp" >"$tmp/bin/circleci-agent"
    chmod +x "$tmp/bin/circleci-agent"

    g() { git -C "$tmp/repo" -c user.email=t@example.com -c user.name=t "$@"; }
    commit() { echo "$1" >"$tmp/repo/file" && g add -A && g commit -qm "$1"; }
    # gate COMMAND JOB NODE [REPO]
    gate() {
        (cd "$tmp" && PATH="$tmp/bin:$PATH" CIRCLE_JOB="$2" CIRCLE_NODE_INDEX="$3" \
            CIRCLE_NODE_TOTAL=4 "$script" "$1" "${4:-$tmp/repo}" >/dev/null 2>&1)
    }
    # expect halt|run LABEL JOB NODE [REPO]
    expect() {
        local want="$1" label="$2" got=run
        shift 2
        rm -f "$tmp/halted"
        if ! gate halt-if-verified "$@"; then
            got=error
        elif [ -f "$tmp/halted" ]; then
            got=halt
        fi
        if [ "$got" = "$want" ]; then
            echo "  ok   $label"
        else
            echo "  FAIL $label: expected $want, got $got"
            failures=$((failures + 1))
        fi
    }

    g init -q -b main
    commit one
    expect run "no record yet" ui_test_ios 0
    gate mark ui_test_ios 0
    expect halt "same tree, job and node" ui_test_ios 0
    expect run "another shard of the same job" ui_test_ios 1
    expect run "another job" lint 0
    g commit -qm same-tree --allow-empty
    expect halt "a new commit with the same tree (squash merge)" ui_test_ios 0
    commit two
    expect run "a different tree" ui_test_ios 0
    expect run "unmeasurable tree fails open" ui_test_ios 0 "$tmp/not-a-repo"
    if gate mark ui_test_ios 0 "$tmp/not-a-repo" && [ ! -e "$tmp/.tree-gate/verified" ]; then
        echo "  ok   an unmeasurable tree records nothing and passes"
    else
        echo "  FAIL mark on an unmeasurable tree"
        failures=$((failures + 1))
    fi
    rm -rf "$tmp"

    if [ "$failures" -gt 0 ]; then
        echo "tree_gate self-test: $failures failure(s)"
        return 1
    fi
    echo "tree_gate self-test: ok"
}

case "${1:-}" in
key) write_key "${2:-.}" || echo "tree_gate: cannot measure this tree" >&2 ;;
mark) mark "${2:-.}" ;;
halt-if-verified) halt_if_verified "${2:-.}" ;;
--self-test) self_test ;;
*)
    echo "usage: tree_gate.sh key|mark|halt-if-verified [REPO] | --self-test" >&2
    exit 2
    ;;
esac
