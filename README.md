# ActiveRecord Caching

Adds "Advanced Caching" to ActiveRecord::Base as described in Adam Hawkins'
blog, [Fast JSON APIs](http://broadcastingadam.com/2012/07/advanced_caching_part_6-fast_json_apis/).

## Installation

Add this line to your application's Gemfile:

    gem 'active_record_caching'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_caching

## Usage

Index controller actions will support `#stale?`

```ruby
class ResourceController < ApplicationController
  responds_to :json

  def index
    # uses the new #cache_key method defined on ActiveRecord::Base to
    # set the etag
    if stale? collection do
      # Use cached JSON from individual hashes to render a collection
      respond_with collection
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/./fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
