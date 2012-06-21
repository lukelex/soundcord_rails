require 'soundcord_rails'

module SoundcordRails
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'soundcord_rails.insert_into_active_record' do |app|
      ActiveSupport.on_load :active_record do
        SoundcordRails::Railtie.insert
      end
    end
  end

  class Railtie
    def self.insert
      SoundcordRails.options[:logger] = Rails.logger

      if defined?(ActiveRecord)
        SoundcordRails.options[:logger] = ActiveRecord::Base.logger
        ActiveRecord::Base.send(:include, SoundcordRails::Glue)
      end
    end
  end
end
