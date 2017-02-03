Pod::Spec.new do |s|
  s.name         = "StyleKit"
  s.version      = "1.0.1"
  s.summary      = "A framework for applying consistent styling to applications."
  s.homepage     = "https://github.com/hoseking/StyleKit"
  s.license      = "MIT"
  s.author       = { "hoseking" => "steviehosking@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/hoseking/StyleKit.git", :tag => "1.0.1" } 
  s.source_files = "Source"
end
