#!/usr/bin/ruby

class AppInfoProvider

  class AppIdentifier
    AppStore = 'com.kjm.circle-ci-iOS'
    Development = 'com.kjm.circle-ci-iOS.development'
  end

  class DisplayName
    AppStore = 'CircleCI'
    Development = 'CircleCI - Dev'
  end

  class Scheme
    AppStore = 'CircleCI-iOS'
    Development = 'CircleCI-iOS'
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
