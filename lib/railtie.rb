require 'jsimple/view_helper'

module Jsimple
  class JsimpleRailtie < Rails::Railtie
    initializer 'jsimple.view_helpers' do
      ActionView::Base.send :include, ViewHelper
    end
  end
end
