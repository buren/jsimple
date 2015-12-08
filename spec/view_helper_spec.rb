require 'spec_helper'

describe Jsimple::ViewHelper do
  describe '#app' do
    class MyViewHelperTester
      include Jsimple::ViewHelper
    end

    it 'returns Jsimple#app result' do
      result = MyViewHelperTester.new.jsimple_app('test_app')
      expect(result.path).to include('test_app')
    end
  end
end
