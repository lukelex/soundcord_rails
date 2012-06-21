module SoundcordRails
  module Glue
    def self.included(base)
      base.extend ClassMethods
      base.class_attribute :phonetized_definitions
    end
  end
end
