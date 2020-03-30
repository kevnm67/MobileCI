#!/usr/bin/ruby

class AppInfoProvider

  class AppIdentifier
    AppStore = 'com.kevnm67.MobileCI-iOS'
    Development = 'com.kevnm67.MobileCI-iOS.development'
    Staging = 'com.kevnm67.MobileCI-iOS.staging'
  end

  class DisplayName
    AppStore = 'MobileCI'
    Development = 'MobileCI - Dev'
    Staging = 'MobileCI - Staging'
  end

  class Scheme
    AppStore = 'MobileCI-iOS'
    Development = 'MobileCI-iOS'
  end

  class Configuration
    AppStore = 'Release'
    Debug = 'Debug'
    Development = 'Debug_Development'
  end

  class AWSPath
    AppStore = 'app-store'
    Development = 'development'
  end
end
