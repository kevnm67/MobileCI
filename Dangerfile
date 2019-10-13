
has_app_changes = !git.modified_files.grep(/Circle-CI-Playground/).empty?

###
### Files to warn if changed:
###

@GL_DANGER_CI_CD_FILES = ['.travis.yml', 'Dangerfile', 'Fastfile', 'Matchfile', 'Deliverfile', 'Appfile', 'Precheckfile']
@GL_DANGER_DEPENDENCY_FILES = ['Gemfile', 'Cartfile', 'Cartfile.private', 'podfile']

# determine if any of the files were modified
def didModify(files_array)
	did_modify_files = false
	files_array.each do |file_name|
		if git.modified_files.include?(file_name) || git.deleted_files.include?(file_name)
			did_modify_files = true

			config_files = git.modified_files.select { |path| path.include? file_name }

			message "This PR changes #{ github.html_link(config_files) }"
		end
	end

	return did_modify_files
end

###
### Warnings
###

warn('Changes to CI/CD files') if didModify(@GL_DANGER_CI_CD_FILES)
warn('Changes to dependency related files') if didModify(@GL_DANGER_DEPENDENCY_FILES)

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
not_declared_trivial = !(github.pr_title.downcase.include? "#trivial")

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

###
### Auto label
###

if github.pr_title.include? "[WIP]"
	auto_label.wip=(github.pr_json["number"])
else
	auto_label.remove("WIP")
end

warn('Big PR, try to keep changes smaller if you can') if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident (e.g. fit -> focuses on a single test).
fail("fit left in tests") if `grep -r "fit Tests/ `.length > 1

# Changelog entries are required for changes to library files.
no_changelog_entry = !git.modified_files.include?("CHANGELOG.md")

# Don't warn about changelog.
temp_skip_changelog = true

if has_app_changes && no_changelog_entry && not_declared_trivial && !temp_skip_changelog
	warn("Any changes to library code should be reflected in the Changelog. Please consider updating the changelog. [Changelog Guidelines](./CHANGELOG.md).")
end

# Warn when library files changed without test coverage.
tests_updated = !git.modified_files.grep(/Tests/).empty?

if has_app_changes && !tests_updated
	warn("Library files were updated without test coverage.  Consider updating or adding tests to cover changes.")
end
