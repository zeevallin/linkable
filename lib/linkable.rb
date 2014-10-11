require "linkable/version"
require "linkable/expression"

module Linkable

  def urls
    self.scan(Linkable::EXPRESSION).map(&:first)
  end

end

String.include(Linkable)