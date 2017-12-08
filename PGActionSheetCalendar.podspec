Pod::Spec.new do |s|
  s.name         = "PGActionSheetCalendar"
  s.version      = "1.0.5"
  s.summary      = "PGActionSheetCalendar"
  s.homepage     = "https://github.com/xiaozhuxiong121/PGActionSheetCalendar"
  s.license      = "MIT"
  s.author       = { "piggybear" => "piggybear_net@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xiaozhuxiong121/PGActionSheetCalendar.git", :tag => s.version }
  s.source_files = "PGActionSheetCalendar", "PGActionSheetCalendar/**/*.swift"
  s.frameworks   = "UIKit"
  s.requires_arc = true

  s.dependency 'FSCalendar'
end
 
