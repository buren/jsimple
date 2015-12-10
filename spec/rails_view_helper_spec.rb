require 'spec_helper'
require 'ostruct'

require 'jsimple/rails_view_helper'

describe Jsimple::RailsViewHelper do
  class String
    def html_safe
      self
    end
  end

  describe '#jsimple_app' do
    class MyViewHelperTester
      include Jsimple::RailsViewHelper
    end

    it 'returns Jsimple#app result' do
      result = MyViewHelperTester.new.jsimple_app('test_app')
      expect(result.path).to include('test_app')
    end
  end

  describe '#jsimple_js_path' do
    it 'returns Jsimple#path result' do
      result = MyViewHelperTester.new.jsimple_js_path('test_app')
      expect(result).to include('test_app')
    end
  end

  describe '#jsimple_js_init' do
    it 'returns Jsimple#app result' do
      result = MyViewHelperTester.new.jsimple_js_init('test_app')
      expect(result).to include('test_app.start')
    end
  end
end
