require "linkable/version"
require "linkable/expression"
require "uri"

module Linkable

  def urls
    self.scan(Linkable::EXPRESSION).map(&:first).map { |uri| URI::parse uri }
  end

  def replace_urls(&blk)
    return unless block_given?
    self.gsub(Linkable::EXPRESSION) { |uri| blk.call URI::parse uri }
  end

  def replace_urls!(&blk)
    return unless block_given?
    self.gsub!(Linkable::EXPRESSION) { |uri| blk.call URI::parse uri }
  end

end

String.include(Linkable)