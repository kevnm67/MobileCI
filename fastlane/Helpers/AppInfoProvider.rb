#!/usr/bin/ruby

class AppInfoProvider

  class AppIdentifier
    APP_STORE = 'com.kevnm67.MobileCI-iOS'
    DEVELOPMENT = 'com.kevnm67.MobileCI-iOS.development'
    STAGING = 'com.kevnm67.MobileCI-iOS.staging'
  end

  class DisplayName
    APP_STORE = 'MobileCI'
    DEVELOPMENT = 'MobileCI - Dev'
    STAGING = 'MobileCI - Staging'
  end

  class Scheme
    APP_STORE = 'MobileCI-iOS'
    DEVELOPMENT = 'MobileCI-iOS'
  end

  class Configuration
    APP_STORE = 'Release'
    DEBUG = 'Debug'
    DEVELOPMENT = 'Debug_Development'
  end

  class AWSPath
    APP_STORE = 'app-store'
    DEVELOPMENT = 'development'
  end
end
