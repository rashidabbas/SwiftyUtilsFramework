
Pod::Spec.new do |s|

  s.name         = "SwiftyUtilsFramework"
  s.version      = "1.0.4"
  s.swift_version = "4.2"
  s.summary      = "This is an amazing framework for all developer from beginner to expert."
  s.description  = "This is an amazingly Utils framework written by Mr Rashid Abbas for utility purpose which is used to boost your development. It contains all utility classes regarding Autolayout and many more extensions functions."
  s.homepage     = "https://github.com/rashidabbas/SwiftyUtilsFramework"
  s.license      = "MIT"
  s.author             = { "Rashid Abbas" => "malikrashidabbas@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/rashidabbas/SwiftyUtilsFramework.git", :tag => s.version }
  s.source_files  = "SwiftyUtilsFramework/**/*.swift"

end
