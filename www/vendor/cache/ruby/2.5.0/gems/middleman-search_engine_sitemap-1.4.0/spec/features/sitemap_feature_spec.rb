require 'spec_helper'
require 'nokogiri'
require 'pathname'

describe "Search engine sitemaps", :feature do
  include XmlHelpers

  it "produces a valid sitemap" do
    run_site 'dummy' do
      set :url_root, 'http://example.com'
      activate :search_engine_sitemap
      ignore '/ignored.html'
    end

    visit '/sitemap.xml'

    schema = Pathname(__dir__) + '../../sitemap.xsd'
    doc = Nokogiri::XML(last_response.body)
    expect(doc).to validate_against_schema(schema)

    expect(doc).to contain_node('url').with_children(
      'loc'        => 'http://example.com/home.html',
      'priority'   => '0.5',
      'changefreq' => 'monthly'
    )

    expect(doc).to contain_node('url').with_children(
      'loc'        => 'http://example.com/about.html',
      'priority'   => '0.2',
      'changefreq' => 'monthly'
    )

    expect(doc).to contain_node('url').with_children(
      'loc'        => 'http://example.com/blog.html',
      'priority'   => '0.5',
      'changefreq' => 'daily'
    )

    expect(doc.to_s).not_to include('http://example.com/ignored.html')
    expect(doc.to_s).not_to include('http://example.com/ignored-in-frontmatter.html')
  end

  it "works with directory indexes" do
    run_site 'dummy' do
      set :url_root, 'http://example.com'
      activate :directory_indexes
      activate :search_engine_sitemap

      ignore '/ignored.html'
    end

    visit '/sitemap.xml'
    doc = Nokogiri::XML(last_response.body)

    expect(doc).to contain_node('url').with_children(
      'loc'        => 'http://example.com/home/',
      'priority'   => '0.5',
      'changefreq' => 'monthly'
    )

    expect(doc).to contain_node('url').with_children(
      'loc'        => 'http://example.com/about/',
      'priority'   => '0.2',
      'changefreq' => 'monthly'
    )

    expect(doc).to contain_node('url').with_children(
      'loc'        => 'http://example.com/blog/',
      'priority'   => '0.5',
      'changefreq' => 'daily'
    )

    expect(doc.to_s).not_to include('http://example.com/ignored/')
    expect(doc.to_s).not_to include('http://example.com/ignored-in-frontmatter/')
  end

  it "supports custom URL processing" do
    run_site 'dummy' do
      set :url_root, 'http://example.com'
      activate :directory_indexes
      activate :search_engine_sitemap, process_url: ->(url) { url.upcase }
    end

    visit '/sitemap.xml'
    doc = Nokogiri::XML(last_response.body)

    expect(doc).to contain_node('url').with_children(
    'loc'        => 'HTTP://EXAMPLE.COM/HOME/',
    'priority'   => '0.5',
    'changefreq' => 'monthly'
    )
  end

  it "ignores resources based on exclude_if result" do
    run_site 'dummy' do
      set :url_root, 'http://example.com'
      activate :search_engine_sitemap,
        exclude_if: ->(resource) { resource.data.ignored_by_proc }

      ignore '/ignored.html'
    end

    visit '/sitemap.xml'
    doc = Nokogiri::XML(last_response.body)

    expect(doc.to_s).not_to include('http://example.com/ignored-by-proc.html')
  end
end
