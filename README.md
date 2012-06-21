#SoundCord Rails
SoundCord Rails is intended as an easy phonetic engine for Active Record. The intent behind it was to keep setup, and dealing with it, as easy as possible and to treat phonetic database searchs as much like other attributes as possible. This means that the possible results for a query are maximized by the phonetic algorithm, even when the input has writing errors.

The basics of soundcord_rails are quite simple: Declare that your model has a phonetic field with the `phonetized` method and give it a name.

Soundcord_rails will automatically set its phonetized counterpart.

##Installation
SoundCord Rails is distributed as a gem, which is how it should be used is your app.

Include the gem in you gemfile.

```ruby
gem "soundcord_rails"
```

Or, if you want to get the latest, you can get master from the main paperclip repository:

```ruby
gem ""soundcord_rails", :git => "git@github.com:lukasalexandre/soundcord_rails.git"
```

If you`are trying to use features that don't seem to be in the latest released gem, but are mentioned in the README, then you probably need to specify the master branch if you want to use them. This README is probably ahead of the  latest released version, if you're reading it on GitHub.

##Quick start
In your model:

```ruby
Class User < ActiveRecord::Base
  phonetized :name
end
```

In your migrations:

```ruby
class addPhonetizedColumnsToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :name_phonetized
    end
  end

  def self.down
    remove_column :users, :name_phonetized
  end
end
```

Or you can use migration generator: `rails generate soundcord_rails user name`