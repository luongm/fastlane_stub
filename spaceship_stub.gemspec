Gem::Specification.new do |s|
  s.name        = 'spaceship_stub'
  s.version     = '0.0.1'
  s.date        = '2017-07-12'
  s.summary     = 'Rails gem for stubbing out Fastlane::Spaceship for writing specs'
  s.description = 'stubbing out Fastlane::Spaceship for writing specs'
  s.authors     = ['Minh Luong']
  s.email       = 'en14vn@gmail.com'
  s.files       = [
    'lib/spaceship_stub.rb',
    'lib/spaceship_stub/tunes_stubbing.rb',
  ]
  s.required_ruby_version = '~> 2.0'
  s.homepage    = 'https://github.com/luongm/spaceship_stub'
  s.license       = 'MIT'
end
