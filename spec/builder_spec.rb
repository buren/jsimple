require 'spec_helper'

describe Jsimple::Builder do
  after(:each) { Jsimple.reset! }

  describe '#app_factory' do
    it 'returns object with path' do
      js_app = described_class.app_factory('test_app', {}, nil)
      expected = 'jsimple/test_app.min.js'
      expect(js_app.path).to eq(expected)
    end

    it 'returns object with init' do
      js_app = described_class.app_factory('test_app', {}, nil)
      expected = "<script>test_app.start(document.getElementById('test_app'), JSON.parse('{}'));</script>"
      expect(js_app.init).to eq(expected)
    end
  end

  describe '#init_js' do
    it 'can generate with name, props and id' do
      name = 'test_app'
      props = { a: 1 }
      id = 'test_id'
      result = described_class.init_js(name, props, id)
      expected = "<script>test_app.start(document.getElementById('test_id'), JSON.parse('{\"a\":1}'));</script>"
      expect(result).to eq(expected)
    end

    it 'can generate default id when id is nil' do
      result = described_class.init_js('test_app', {}, nil)
      expected = "<script>test_app.start(document.getElementById('test_app'), JSON.parse('{}'));</script>"
      expect(result).to eq(expected)
    end
  end

  describe '#js_path' do
    it 'can generate production path' do
      expect(described_class.js_path('test_app')).to eq('jsimple/test_app.min.js')
    end

    it 'can generate development path' do
      Jsimple.development = true
      expect(described_class.js_path('test_app')).to eq('http://localhost:3100/test_app.js')
    end
  end

  it 'can generate development path' do
    Jsimple.development = true
    name, host, port = 'test_app', 'localhost', '3100'
    result = described_class.js_development_path(name, host, port)
    expected = 'http://localhost:3100/test_app.js'
    expect(result).to eq(expected)
  end

  it 'can generate production path' do
    expect(described_class.js_production_path('test_app')).to eq('jsimple/test_app.min.js')
  end
end
