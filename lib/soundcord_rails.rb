require "soundcord_rails/version"

# Paperclip allows file attachments that are stored in the filesystem. All graphical
# transformations are done using the Graphics/ImageMagick command line utilities and
# are stored in Tempfiles until the record is saved. Paperclip does not require a
# separate model for storing the attachment's information, instead adding a few simple
# columns to your table.
#
# Author:: Jon Yurek
# Copyright:: Copyright (c) 2008-2011 thoughtbot, inc.
# License:: MIT License (http://www.opensource.org/licenses/mit-license.php)
#
# Paperclip defines an attachment as any file, though it makes special considerations
# for image files. You can declare that a model has an attached file with the
# +has_attached_file+ method:
#
#   class User < ActiveRecord::Base
#     has_attached_file :avatar, :styles => { :thumb => "100x100" }
#   end
#
#   user = User.new
#   user.avatar = params[:user][:avatar]
#   user.avatar.url
#   # => "/users/avatars/4/original_me.jpg"
#   user.avatar.url(:thumb)
#   # => "/users/avatars/4/thumb_me.jpg"
#
# See the +phonetized+ documentation for more details.

require 'erb'
require 'digest'
require 'tempfile'
require 'mime/types'

require 'soundcord_rails/railtie' if defined?(Rails)

# The base module that gets included in ActiveRecord::Base. See the
# documentation for SoundcordRails::ClassMethods for more useful information.
module SoundcordRails
  extend Helpers
  extend Logger
  extend ProcessorHelpers

  module ClassMethods
    # +phonetized+ gives the class, it is called on, an attribute that maps to a file. This
    # is typically a file stored somewhere on the filesystem and has been uploaded by a user.
    # The attribute returns a Paperclip::Attachment object which handles the management of
    # that file. The intent is to make the attachment as much like a normal attribute. The
    # thumbnails will be created when the new file is assigned, but they will *not* be saved
    # until +save+ is called on the record. Likewise, if the attribute is set to +nil+ is
    # called on it, the attachment will *not* be deleted until +save+ is called. See the
    # Paperclip::Attachment documentation for more specifics. There are a number of options
    #
    #   class Person
    #     phonetized :name
    #   end
    def phonetized(name)
      include InstanceMethods

      if phonetized_definitions.nil?
        self.phonetized_definitions = {}
      else
        self.phonetized_definitions = self.phonetized_definitions.dup
      end

      Paperclip.classes_with_attachments << self.name
      Paperclip.check_for_url_clash(name,phonetized_definitions[name][:url],self.name)

      define_method "update_#{name}_phonetized" do
        send("#{name}_phonetized", send(name))
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
