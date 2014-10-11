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
  ) }

  describe "String#urls" do

    subject(:urls) { text.urls }

    let(:domain) { "www.domain.com" }
    it "parses domain" do
      expect(urls).to include domain
    end

    let(:apex_domain) { "domain.com?foo=bar" }
    it "parses apex domain" do
      expect(urls).to include apex_domain
    end

    let(:subdomain) { "sub.domain.com" }
    it "parses subdomain" do
      expect(urls).to include subdomain
    end

    let(:multiple_subdomains) { "second.sub.doma.in/foo/bar?baz=biz" }
    it "parses multiple subdomains" do
      expect(urls).to include multiple_subdomains
    end

    let(:complex_hostname) { "domain.w1th-d4shes-4nd-numbe.rs" }
    it "parses complex hostnames" do
      expect(urls).to include complex_hostname
    end

    let(:custom_schema) { "protocol://with.domain.com?queries=too" }
    it "parses custom schema" do
      expect(urls).to include custom_schema
    end

    let(:schema_relative) { "//with.domain.com?queries=too" }
    it "parses schema relative" do
      expect(urls).to include schema_relative
    end

    let(:url_in_query_parameters) { "domain.w1th-d4shes-4nd-numbe.rs/foobar?is=http://www.another-domain.com" }
    it "parses domain in query parameters" do
      expect(urls).to include url_in_query_parameters
    end

  end

end