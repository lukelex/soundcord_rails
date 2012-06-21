# SoundCord Rails is intended as an easy phonetic engine for Active Record.
# The intent behind it was to keep setup, and dealing with it, as easy as
# possible and to treat phonetic database searchs as much like other attributes
# as possible. This means that the possible results for a query are maximized by
# the phonetic algorithm, even when the input has writing errors.
#
# Author:: Lukas Alexandre
# Copyright:: Copyright (c) 2012 thoughtbot, inc.
# License:: MIT License (http://www.opensource.org/licenses/mit-license.php)

require "soundcord_rails/version"
# require 'erb'
# require 'digest'
# require 'tempfile'
# require 'mime/types'
require 'soundcord'

require 'soundcord_rails/railtie' if defined?(Rails)

# The base module that gets included in ActiveRecord::Base. See the
# documentation for SoundcordRails::ClassMethods for more useful information.
module SoundcordRails

  module ClassMethods
    # +phonetized+ gives the class, it is called on, an attribute that maps to the phonetized
    # version of him self. The phonetized field will be automatically filled upon record +save+.
    # Likewise, if the attribute is set to +nil+ is the phonetized field will *not* be deleted
    # until +save+ is called.
    #
    #   class Person < ActiveRecord::Base
    #     phonetized :name
    #   end
    def phonetized(name)

      if phonetized_definitions.nil?
        self.phonetized_definitions = {}
      else
        self.phonetized_definitions = self.phonetized_definitions.dup
      end

      # Paperclip.classes_with_attachments << self.name
      # Paperclip.check_for_url_clash(name,phonetized_definitions[name][:url],self.name)

      define_method "update_#{name}_phonetized" do
        send("#{name}_phonetized=", send(name).phonetize)
      end

      before_save "update_#{name}_phonetized"
    end

    # Returns the attachment definitions defined by each call to
    # has_attached_file.
    def phonetized_definitions
      self.phonetized_definitions
    end
  end
end
