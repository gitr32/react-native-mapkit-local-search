require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-mapkit-local-search"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/gitr32/react-native-mapkit-local-search.git", :tag => "#{s.version}" }

  
  s.source_files = "ios/**/*.{h,m,mm,swift}"
  

  s.dependency "React"
end
