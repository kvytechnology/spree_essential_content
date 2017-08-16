# Spree Essential Content [![Build Status](https://secure.travis-ci.org/FineLineAutomation/spree_essential_content.png)](http://travis-ci.org/FineLineAutomation/spree_essential_content)

Spree Essential Content is a fully featured CMS with pages, contents, images and more. It has a blog complete with archives, categories, tags and related products. base for many content related extensions for Spree. It also provides an asset-upload interface.


```ruby
gem 'spree_essential_content', github: 'kvytechnology/spree_essential_content'
```

If you are using a version of spree lower than 2.4, please see one of the stable branches for the right version of this gem. Please also note I am not maintaining anything below Spree 2.3 now.

Then run:

```bash
bundle install
```

Once that's complete, run the migration generator and migrate your database:

Now run the generator to install the extension.

```bash
rails g spree_essential_content:install
```

Then migrate your database:

```bash
rake db:migrate
```


The test suite can be run like so:

```bash
bundle exec rake test_app
bundle exec rspec
```

People Responsible for the Original spree_essentials gem
* Spencer Steffen ([@citrus](https://github.com/citrus))
* Michael Bianco ([@iloveitaly](https://github.com/iloveitaly))
* Victor Zagorski ([@shaggyone](https://github.com/shaggyone))

People that have contributed to @FineLineAutomation's forked version
* Nate Lowrie ([@FineLineAutomation](https://github.com/FineLineAutomation))


If you'd like to help out feel free to fork and send me pull requests!


------------------------------------------------------------------------------
License
------------------------------------------------------------------------------

Copyright (c) 2014 Spencer Steffen, citrus, Nate Lowrie & Fine Line Automation, released under the New BSD License All rights reserved.
