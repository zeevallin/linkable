require "linkable/version"
require "linkable/expression"
require "uri"

module Linkable

  def urls
    self.scan(Linkable::EXPRESSION).map(&:first).map { |uri| URI::parse uri }
  end

end

String.include(Linkable)