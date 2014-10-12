# Linkable
Parsing libraries been getting outdated as the web evolve. Linkable takes a scalable approach supporting gTLDs, custom schemas and complex query parameters.

## Usage

#### Require the library
```ruby
require "linkable"
```

#### List all urls in a string
```ruby
text = "Have you heard that github.com/zeeraw/linkable will detect your proprietary://special.snowflake.domain domain."
text.urls
# => [#<URI::Generic URL:github.com/zeeraw/linkable>, #<URI::Generic proprietary://special.snowflake.domain>]
```

#### Replace urls with link tags
```ruby
"Follow me on twitter http://twitter.com/zeeraw".link
# => "Follow me on twitter <a href='http://twitter.com/zeeraw'>http://twitter.com/zeeraw</a>"
```

#### Replace urls manually
```ruby
text = "Follow me on twitter http://twitter.com/zeeraw"
text.replace_urls { |url| "<a href=#{ url }> @#{ url.path[1..-1] }</a>" }
# => "Follow me on twitter <a href='http://twitter.com/zeeraw'>@zeeraw</a>"
```

## Installation
Add this line to your project's Gemfile:

```ruby
gem "linkable"
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install linkable
```
