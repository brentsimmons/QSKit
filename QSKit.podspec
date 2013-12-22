Pod::Spec.new do |s|
  s.name         = "QSKit"
  s.version      = "0.0.1"
  s.summary      = "Q Branch’s collection of Cocoa categories and utilities."
  s.homepage     = "https://github.com/quartermaster/QSKit"
  s.license      = 'MIT'
  s.author       = { "Q Branch" => "support@qbranch.co" }
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
  s.source       = { :git => "https://github.com/quartermaster/QSKit.git", :tag => "v0.0.1" }
  
  s.ios.frameworks = 'Foundation'
  s.osx.frameworks = 'Foundation'
  s.libraries   = 'xml2'
  s.requires_arc = true
  #s.header_mappings_dir = 'Classes'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'Classes/*.{h,m}',
                        'Classes/Foundation/*.{h,m}',
                        'Classes/Web/*.{h,m}',
                        'Classes/XML/*.{h,m}',
                        'Classes/Images/QS*.{h,m}'
    core.ios.source_files = 'Classes/Images/UI*.{h,m}',
                            'Classes/UIKit/*.{h,m}'
    core.osx.source_files = 'Classes/Images/NS*.{h,m}',
                            'Classes/AppKit/*.{h,m}'
  end

  s.subspec 'SQLite' do |sqlite|
    sqlite.source_files = 'Classes/SQLite/*.{h,m}'
    sqlite.dependency 'FMDB', '~>2'
  end

end
