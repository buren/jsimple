# Jsimple [![Build Status](https://travis-ci.org/buren/jsimple.svg?branch=master)](https://travis-ci.org/buren/jsimple) [![Code Climate](https://codeclimate.com/github/buren/jsimple/badges/gpa.svg)](https://codeclimate.com/github/buren/jsimple)

Easy integration between (legacy) Rails apps, and JavaScript.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsimple'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsimple

## Configure

In order to have this make sense with your current setup you probably want to configure some of the defaults.

Below are all of the available configuration values and their defaults.

__Host__:

```ruby
Jsimple.host = 'localhost'
```
Server host for the JS client (usually Node) in development mode. Default is localhost.

__Port__:

```ruby
Jsimple.port = '3100'
```
Server port for the JS client (usually Node) in development mode. Default is 3100.

__Development__:

```ruby
Jsimple.development = false
```
Whether to start Jsimple in development mode. The default is false unless your running Rails then `Rails.env.development?` is the default.

__JS start command__:

```ruby
Jsimple.js_start_command = 'start'
```
JS function name the legacy app will call to initialize the JS app.

__JS path prefix__:

```ruby
Jsimple.js_path_prefix = 'jsimple'
```
JS path prefix to prepend to the app name in production.

__JS dev path prefix__:

```ruby
Jsimple.js_dev_path_prefix = ''
```
JS path prefix to prepend to the app name in development.


## Usage

```ruby
data = {name: 'Alice', age: 26}
app = Jsimple.app('ContactList', props: data, id: 'contact-list-id')
app.path
# In production
#   => jsimple/test_app.min.js
# In development
#   => http://localhost:3100/test_app.min.js
app.init
# => <script>
#      test_app.start(document.getElementById('contact-list-id'), JSON.parse('{"name": "Alice", "age": 26}'));
#    </script>
```

:warning: _Security note_: XSS is possible if a user is allowed to set arbitrary values to `name` and `id`. `props` is serialized to JSON and should therefore be safe.

#### Rails integration

If your using Rails you get a couple of helper methods are included.

Example
```
<%= javascript_indlude_tag jsimple_js_path('js_app_name') %>
<%= jsimle_js_init('js_app_name') %>
```

You will need to add the production js bundles to your path.

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( jsimple/* )
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/buren/jsimple. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
