RSpec.describe Linkable do

  let(:text) { %Q(
    This is a domain called #{ domain } which is my favorite domain.
    I can have query parameters in #{ apex_domain } isn't it cool?
    Subdomains work too #{ subdomain } the ones with query params too
    #{ multiple_subdomains } (those are simply the best).

    Even the silly ones with numbers & dashes #{ complex_hostname } are fully functional.

    Got a super cool custom schema? #{ custom_schema } is problem what so ever!

    Schema relative URLs are pretty common these days, if you need it, we got it #{ schema_relative }

    And for the grand finale is when you put another domain in the query params #{ url_in_query_parameters } WOW!"

    While something like #{ underscored } is not matched due to underscores.
  ) }

  describe "String#urls" do

    subject(:urls) { text.urls }

    let(:domain) { URI::parse "www.google.com" }
    it "parses domain" do
      expect(urls).to include domain
    end

    let(:apex_domain) { URI::parse "loopia.se?foo=bar" }
    it "parses apex domain" do
      expect(urls).to include apex_domain
    end

    let(:subdomain) { URI::parse "api.github.com" }
    it "parses subdomain" do
      expect(urls).to include subdomain
    end

    let(:multiple_subdomains) { URI::parse "site.stage.internal.net/path/to?my=variable" }
    it "parses multiple subdomains" do
      expect(urls).to include multiple_subdomains
    end

    let(:complex_hostname) { URI::parse "14m.t00-c00l-4-sch00l.ninja" }
    it "parses complex hostnames" do
      expect(urls).to include complex_hostname
    end

    let(:custom_schema) { URI::parse "winzip://with.domain.com?queries=too" }
    it "parses custom schema" do
      expect(urls).to include custom_schema
    end

    let(:schema_relative) { URI::parse "//with.domain.com?queries=too" }
    it "parses schema relative" do
      expect(urls).to include schema_relative
    end

    let(:url_in_query_parameters) { URI::parse "domain.w1th-d4shes-4nd-numbe.rs/foobar?is=http://www.another-domain.com" }
    it "parses domain in query parameters" do
      expect(urls).to include url_in_query_parameters
    end

    let(:underscored) { URI::parse "try.under_score.app" }
    it "parses underscores" do
      expect(urls).to include underscored
    end

  describe "String#replace_urls" do
    let(:text) { "Please follow me on twitter http://twitter.com/zeeraw" }
    subject(:replaced) { text.replace_urls { |url| "<a href='#{ url }'>@#{ url.path[1..-1] }</a>" } }
    it "converts urls with block" do
      expect(replaced).to include "<a href='http://twitter.com/zeeraw'>@zeeraw</a>"
    end
    it "duplicates the string" do
      expect(text.link.object_id).to_not match text.object_id
    end
  end

  describe "String#replace_urls!" do
    let(:text) { "Please follow me on twitter http://twitter.com/zeeraw" }
    subject(:replaced) { text.replace_urls! { |url| "<a href='#{ url }'>@#{ url.path[1..-1] }</a>" } }
    it "converts urls with block" do
      expect(replaced).to include "<a href='http://twitter.com/zeeraw'>@zeeraw</a>"
    end
    it "manipulates the string" do
      expect(text.link!.object_id).to match text.object_id
    end
  end

  end

end