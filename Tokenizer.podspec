Pod::Spec.new do |s|
  s.name             = "Tokenizer"
  s.version          = "1.1.1"
  s.summary          = "A tiny human language tokenizer framework in Swift."
  s.description      = <<-DESC
                        Tokenizer is a tiny human language tokenizer framework in Swift..
                        DESC

  s.homepage         = "https://github.com/Meniny/Tokenizer"
  s.license          = 'MIT'
  s.author           = { "Elias Abel" => "Meniny@qq.com" }
  s.source           = { :git => "https://github.com/Meniny/Tokenizer.git", :tag => s.version.to_s }
  s.social_media_url = 'https://meniny.cn/'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Tokenizer/**/*.{h,swift}'
  s.public_header_files = 'Tokenizer/**/*{.h}'
  s.frameworks = 'Foundation'
#s.dependency ""
end
