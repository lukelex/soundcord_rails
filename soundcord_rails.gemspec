# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "soundcord_rails/version"

Gem::Specification.new do |s|
  s.name        = "soundcord_rails"
  s.version     = SoundcordRails::VERSION
  s.authors     = ["Lukas Alexandre"]
  s.email       = ["lukeskytm@gmail.com"]
  s.homepage    = "https://github.com/lukasalexandre/soundcord_rails"
  s.summary     = %q{A SoundCord integration for Rails}
  s.description = %q{A SoundCord integration for Rails}

  s.rubyforge_project = "soundcord_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_development_dependency "soundcord"
  s.add_dependency 'soundcord', '~> 0.1.1'
end
