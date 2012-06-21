require 'rails/generators/active_record'

class SoundCordRailsGenerator < ActiveRecord::Generators::Base
  desc "Create a migration to add soundcord-specific field to your model. " +
       "The NAME argument is the name of your model, and the following " +
       "arguments are the name of the columns to be phonetized"

  argument :column_names, :required => true, :type => :array, :desc => "The names of the column(s) to phonetize.",
           :banner => "attachment_one attachment_two attachment_three ..."

  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def generate_migration
    migration_template "soundcord_rails_migration.rb.erb", "db/migrate/#{migration_file_name}"
  end

  protected

  def migration_name
    "add_phonetized_columns_#{attachment_names.join("_")}_to_#{name.underscore.pluralize}"
  end

  def migration_file_name
    "#{migration_name}.rb"
  end

  def migration_class_name
    migration_name.camelize
  end
end