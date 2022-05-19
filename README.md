# Mobile CI

<p align="center">
	CI playground mainly testing circle CI orbs and GitHub actions.
</p>
<br>

<body>
	<table>
		<thead>
			<tr>
				<th>Service</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		<tr>
				<td>Circle CI</td>
				<td><a href="https://circleci.com/kevnm67/MobileCI">
						<img src="https://circleci.com/gh/kevnm67/MobileCI.svg?style=svg" />
				</a></td>
			</tr>
			<tr>
				<td>Travis CI</td>
				<td><a href="https://travis-ci.com/kevnm67/MobileCI">
						<img src="https://travis-ci.com/kevnm67/MobileCI.svg?branch=main" />
					</a></td>
			</tr>
			<tr>
				<td>Bitrise io</td>
				<td><a href="https://app.bitrise.io/app/0330010d71e169b0">
						<img src="https://app.bitrise.io/app/0330010d71e169b0/status.svg?token=-p7HyqHPA2yhM6qJ314LHA&branch=master" />
					</a></td>
			</tr>
			<tr>
				<td>Maintainability</td>
				<td> <a href="https://codeclimate.com/github/kevnm67/MobileCI/maintainability"><img src="https://api.codeclimate.com/v1/badges/355acfb7dbfab41bec2d/maintainability" /></a> </td>
			</tr>
			<tr>
			<td>Code Coverage</td>
			<td><a href="https://codeclimate.com/github/kevnm67/MobileCI/test_coverage">
					<img src="https://api.codeclimate.com/v1/badges/355acfb7dbfab41bec2d/test_coverage" />
				</a></td>
			</tr>
		</tbody>
	</table>
</body>
<br>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.1-orange.svg?style=flat" alt="Swift 5.1">
   </a>
   <a href="http://cocoapods.org/pods/MobileCI">
      <img src="https://img.shields.io/cocoapods/v/MobileCI.svg?style=flat" alt="Version">
   </a>
   <a href="https://github.com/kevnm67/MobileCI/releases">
      <img src="https://img.shields.io/github/v/release/kevnm67/MobileCI?include_prereleases" alt="GitHub release">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Info](#info)
- [Setup](#setup)
	- [[Komondor](https://github.com/shibapm/Komondor)](#komondorhttpsgithubcomshibapmkomondor)
- [Continuous integration](#continuous-integration)
	- [<img height="24" width="24" src="https://unpkg.com/simple-icons@latest/icons/circleci.svg" /> Circle CI](#img-height24-width24-srchttpsunpkgcomsimple-iconslatesticonscirclecisvg-circle-ci)
	- [<img height="24" width="24" src="https://unpkg.com/simple-icons@latest/icons/travisci.svg" /> Travis CI](#img-height24-width24-srchttpsunpkgcomsimple-iconslatesticonstraviscisvg-travis-ci)
	- [<img height="24" width="24" src="https://simpleicons.org/icons/bitrise.svg" /> Bitrise](#img-height24-width24-srchttpssimpleiconsorgiconsbitrisesvg-bitrise)
- [GitHub Actions](#github-actions)
	- [github-tag-action](#github-tag-action)
- [Features](#features)
- [References/Credits](#referencescredits)

<!-- /TOC -->
## Info

A playground for GitHub actions and CI's for iOS development.

## Setup

### [Komondor](https://github.com/shibapm/Komondor)

> Git Hook automation for Swift and Xcode projects. A port of Husky to Swift.

- Install Komondor by running `swift run komondor install`

## Continuous integration

### <img height="24" width="24" src="https://unpkg.com/simple-icons@latest/icons/circleci.svg" /> Circle CI

The [config file](.circleci/config.yml) defines multiple jobs and the workflow for circle builds.

### <img height="24" width="24" src="https://unpkg.com/simple-icons@latest/icons/travisci.svg" /> Travis CI

See [.travis.yml](.circleci/config.yml)

### <img height="24" width="24" src="https://simpleicons.org/icons/bitrise.svg" /> Bitrise

## GitHub Actions

### github-tag-action

> A [Github Action](https://github.com/anothrNick/github-tag-action) to automatically bump and tag master, on merge, with the latest SemVer formatted version.

- A tag is automatically created for release branches.
- Manual Bumping is possible by including any of the following in a commit message: #major, #minor, or #patch
  - NOTE: If multiple are present the highest-ranking takes precedence.

## Features

- [x] Circle CI with a custom ORB
- [x] Travis CI
- [x] Bitrise CI
- [x] Caching strategy - CI build performance
- [ ] git commit hooks
- [ ] Circle CI ORB example
- [ ] Documentation

GitHub actions.

- [x] Tag action
- [ ] Auto label
- [ ] Auto merge
- [ ] GitFlow

## References/Credits

- [Simple icons](https://github.com/simple-icons/simple-icons)
