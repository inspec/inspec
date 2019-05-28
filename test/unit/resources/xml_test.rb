require 'helper'
require 'inspec/resource'
require 'rexml/document'

describe 'Inspec::Resources::XML' do
  describe 'when loading valid XML' do
    let (:resource) { load_resource('xml', 'default.xml') }

    it 'gets params as a document' do
      _(resource.params).must_be_kind_of REXML::Document
    end

    it 'retrieves empty array if xpath cannot be found' do
      _(resource.send('missing')).must_equal []
    end

    it 'retrieves xpath by name' do
      _(resource.send('breakfast_menu/food[1]/name')).must_equal ['Belgian Waffles']
      _(resource.send('/breakfast_menu/food[1]/name')).must_equal ['Belgian Waffles']
    end

    it 'retrieves many xpaths by name' do
      _(resource.send('/breakfast_menu/food/name')).must_equal ['Belgian Waffles', 'Strawberry Belgian Waffles']
      _(resource.send('//name')).must_equal ['Belgian Waffles', 'Strawberry Belgian Waffles']
    end
  end

  describe 'when loading xml with attributes' do
    let (:resource) { load_resource('xml', 'database.xml') }

    it 'gets params as a document' do
      _(resource.params).must_be_kind_of REXML::Document
    end

    it 'retrieves empty array if xpath cannot be found' do
      _(resource.send('missing')).must_equal []
    end

    it 'retrieves attribute value through xpath' do
      _(resource.send('//property[@name="url"]/@value')).must_equal ['jdbc:oracle:thin:@databaseserver.domain.tld:1521/DBO.DOMAIN.TLD']
      _(resource.send('/beans/bean[@id="dataSource"]/property[@name="url"]/@value')).must_equal ['jdbc:oracle:thin:@databaseserver.domain.tld:1521/DBO.DOMAIN.TLD']
    end
  end

  describe 'when loading xml and requesting a count' do
    let (:resource) { load_resource('xml', 'database.xml') }

    it 'gets count of nodes in the document' do
      _(resource.send('count(//*)')).must_equal [9]
    end
  end

  describe 'when loading xml and evaluating a boolean result' do
    let (:resource) { load_resource('xml', 'database.xml') }

    it 'checks if a node is true-like' do
      _(resource.send('boolean(/beans/bean/@lazy-init)')).must_equal [true]
    end
  end

  describe 'when loading xml and evaluating a string result' do
    let (:resource) { load_resource('xml', 'database.xml') }

    it 'checks if a node is string-like' do
      _(resource.send('concat(string(/beans/bean/@lazy-init)," <--")')).must_equal ["true <--"]
    end
  end
end