# frozen_string_literal: true

fastlane_require 'fileutils'
require './Helpers/AppInfoProvider.rb'

platform :ios do

  ############
  ## Badges ##
  ############

  desc 'Badge app icon per environment'
  desc ''
  lane :p_badge_environment do |options|
    environment_name = options[:environment_name] || 'Build'
    final_text = "#{environment_name}-#{get_build_number}"
    badge_color = options[:badge_color_option] || 'blue'
    icon_glob_dir = "/#{ENV['ROOT_PROJ_FOLDER']}/**/*.appiconset/*.{png,PNG}"

    add_badge(
      shield: "#{final_text}-#{badge_color}",
      no_badge: true,
      dark: true,
      glob: icon_glob_dir
    )
  end

  ################
  ##   Signing  ##
  ################

  desc 'Install all iOS certs'
  desc ''
  lane :match_all_certs do
    ids = [
      AppInfoProvider::AppIdentifier::DEVELOPMENT,
      AppInfoProvider::AppIdentifier::STAGING,
      AppInfoProvider::AppIdentifier::APP_STORE
    ]

    UI.header "Matching all Certs"

    ids.each do |scheme|
      UI.message "Running match for scheme #{scheme}"
      run_match(
        types: %w[development adhoc appstore],
        app_identifier: scheme,
        force: true
      )
    end
  end

  desc 'Sets up CI creating a temporary keychain and imports certs.'
  desc ''
  private_lane :p_setup_signing do |options|
    UI.error 'You must provide an app_id to setup signing with match!' unless options.key?(:app_id)

    #setup_circle_ci if is_ci

    run_match(
      types: %w[development adhoc appstore],
      app_identifier: options[:app_id]
    )
  end

  override_lane :run_match do |options|
    UI.error 'Missing an array of match distribution types.' unless options.key?(:types)
    
    appstore_auth
    
    distribution_methods = options[:types]
    distribution_methods.each do |distribution_method|
      match(
        app_identifier: options[:app_identifier] || ENV['APP_IDENTIFIER'],
        type: distribution_method,
        generate_apple_certs: true,
        force_for_new_devices: true,
        force: options[:force] || false
      )
    end
  end

  desc 'Authenticate via app store connects api'
  private_lane :appstore_auth do
    app_store_connect_api_key(
      key_id: ENV['APPSTORE_KEY_ID'],
      issuer_id: ENV['APPSTORE_ISSUER_ID'],
      key_content: ENV['APPSTORE_KEY_CONTENT'],
      in_house: false
    )
  end
end