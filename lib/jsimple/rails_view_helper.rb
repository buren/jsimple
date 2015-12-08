module Jsimple
  module RailsViewHelper
    def jsimple_app(name, props: {}, id: nil)
      js_app = Jsimple.app(name, props: {}, id: nil)
      js_app.path = js_app.path.html_safe
      js_app.init = js_app.init.html_safe
      js_app
    end
  end
end
