# Sidekiq::Later

[![Build Status](https://travis-ci.org/craigmcnamara/sidekiq-later.svg?branch=master)](https://travis-ci.org/craigmcnamara/sidekiq-later)

Informal asynchronous method dispatching backed by sidekiq. Like the `.delay` method, but instead of serializing an instance to YAML in Redis, this is strictly class name and primary key dispatching and only supports simple simple positional args.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-later'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-later

## Usage

In your application:

```ruby
class Listing < ActiveRecord::Base
  def attach_photo_from_url(url)
    # A thing that takes a while or can fail and wants retries.
  end
end

listing = Listing.find(1)
photo_url = "https://www.example.com/photo.jpg"

# Run method on Sidekiq without making a worker
listing.later.attach_photo_from_url photo_url
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craigmcnamara/sidekiq-later. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sidekiq::Later project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/craigmcnamara/sidekiq-later/blob/master/CODE_OF_CONDUCT.md).
