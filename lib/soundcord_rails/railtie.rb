require 'soundcord_rails'

module SoundCordRails
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'soundcord_rails.insert_into_active_record' do |app|
      ActiveSupport.on_load :active_record do
        SoundCordRails::Railtie.insert
      end
    end
  end

  class Railtie
    def self.insert
      SoundCordRails.options[:logger] = Rails.logger

      if defined?(ActiveRecord)
        SoundCordRails.options[:logger] = ActiveRecord::Base.logger
        ActiveRecord::Base.send(:include, SoundCordRails::Glue)
      end
    end
  end
end
