#SoundCord Rails

[![Build Status](https://secure.travis-ci.org/lukasalexandre/soundcord_rails.png)](http://travis-ci.org/lukasalexandre/soundcord)

SoundCord Rails is intended as an easy phonetic engine for Active Record. The intent behind it was to keep setup, and dealing with it, as easy as possible and to treat phonetic database searchs as much like other attributes as possible. This means that the possible results for a query are maximized by the phonetic algorithm, even when the input has writing errors.

The basics of soundcord_rails are quite simple: Declare that your model has a phonetic field with the `phonetized` method and give it a name.

Soundcord_rails will automatically set its phonetized counterpart.

##Installation
SoundCord Rails is distributed as a gem, which is how it should be used is your app.

Include the gem in you gemfile.

```
gem "soundcord_rails"
```

Or, if you want to get the latest, you can get master from the main soundcord_rails repository:

```
gem "soundcord_rails", :git => "git@github.com:lukasalexandre/soundcord_rails.git"
```

If you`are trying to use features that don't seem to be in the latest released gem, but are mentioned in the README, then you probably need to specify the master branch if you want to use them. This README is probably ahead of the  latest released version, if you're reading it on GitHub.

##Quick start
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

Or you can use migration generator: `rails generate soundcord_rails [model] [fields]`

In your model:

```ruby
Class User < ActiveRecord::Base
  phonetized :name
end
```

##Information

###To do:

* Add initializer options;
* Search within database.

##How to contribute
Please ensure that you provide appropriate test coverage and ensure the documentation is up-to-date. It is encouraged that you perform changes in a clean topic branch rather than a master and that you create a pull request for them. This will facilitate discussion and revision.

Please be clean, keep your commits atomic and with the smallest possible logical change. This will increase the likelihood of your submission to be used.

###Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug.

https://github.com/lukasalexandre/soundcord_rails/issues

##License
Copyright (c) 2012 Lukas Alexandre. http://www.devinscene.com.br/

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to use, copy and modify copies of the Software, subject
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
