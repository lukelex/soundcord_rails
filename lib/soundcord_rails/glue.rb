module Paperclip
  module Glue
    def self.included(base)
      base.extend ClassMethods
      base.class_attribute :phonetized_definitions

      # locale_path = Dir.glob(File.dirname(__FILE__) + "/locales/*.{rb,yml}")
      # I18n.load_path += locale_path unless I18n.load_path.include?(locale_path)
    end
  end
end
