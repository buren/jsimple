require 'jsimple/rails_view_helper'

module Jsimple
  class JsimpleRailtie < ::Rails::Railtie
    initializer 'jsimple.view_helpers' do
      ActionView::Base.send :include, RailsViewHelper
    end
  end
end
