require 'spec_helper'
require 'ostruct'

require 'jsimple/rails_view_helper'

describe Jsimple::RailsViewHelper do
  class String
    def html_safe
      self
    end
  end
  describe '#app' do
    class MyViewHelperTester
      include Jsimple::RailsViewHelper
    end

    it 'returns Jsimple#app result' do
      result = MyViewHelperTester.new.jsimple_app('test_app')
      expect(result.path).to include('test_app')
    end
  end
end
