# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "soundcord_rails/version"

Gem::Specification.new do |s|
  s.name        = "soundcord_rails"
  s.version     = SoundcordRails::VERSION
  s.authors     = ["Lukas Alexandre"]
  s.email       = ["lukasalexandre@me.com"]
  s.homepage    = "https://github.com/lukelex/soundcord_rails"
  s.summary     = %q{Phonetic fields as attributes for ActiveRecord}
  s.description = %q{Easy phonetic comparisons for ActiveRecord}

  s.rubyforge_project = "soundcordrails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'soundcord', '~> 0.4.0'
end
