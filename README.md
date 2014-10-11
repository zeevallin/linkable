# Linkable
Parsing libraries been getting outdated as the web evolve. Linkable takes a scalable approach supporting gTLDs, custom schemas and complex query parameters.

## Usage

```ruby
require "linkable"

string = "Have you heard that github.com/zeeraw/linkable will detect your proprietary://special.snowflake.domain domain."
string.urls
# => ["github.com/zeeraw/linkable", "proprietary://special.snowflake.domain"]
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
