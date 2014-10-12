require "linkable/version"
require "linkable/expression"
require "uri"

module Linkable

  LINK_URI = Proc.new { |uri| "<a href='#{ uri }'>#{ uri }</a>" }.freeze

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

  def link
    self.gsub(Linkable::EXPRESSION, &LINK_URI)
  end

  def link!
    self.gsub!(Linkable::EXPRESSION, &LINK_URI)
  end

end

String.include(Linkable)