#!/usr/bin/ruby

class AppInfoProvider

  class AppIdentifier
    AppStore = 'com.kjm.mobile-ci-iOS'
    Development = 'com.kjm.mobile-ci-iOS.development'
  end

  class DisplayName
    AppStore = 'MobileCI'
    Development = 'MobileCI - Dev'
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
