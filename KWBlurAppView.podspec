Pod::Spec.new do |s|
  s.name             = 'KWBlurAppView'
  s.version          = '0.1.0'
  s.summary          = 'blur app screen when switch app'

  s.homepage         = 'https://github.com/golfiti/KWBlurAppView'
  s.screenshots      = 'http://i.giphy.com/l3vR75Xh2SuvUbnVe.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'golfiti' => 'golfitiz@gmail.com' }
  s.source           = { :git => 'https://github.com/golfiti/KWBlurAppView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/golfiti'

  s.ios.deployment_target = '8.0'
  s.source_files        = 'KWBlurAppView/Classes/*.swift'
  s.requires_arc        = true

end
