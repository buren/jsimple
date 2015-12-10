module Jsimple
  module RailsViewHelper
    def jsimple_app(name, props: {}, id: nil)
      js_app = Jsimple.app(name, props: {}, id: nil)
      js_app.path = js_app.path.html_safe
      js_app.init = js_app.init.html_safe
      js_app
    end

    def jsimple_js_path(name, props: {}, id: nil)
      Jsimple.path(name, props: {}, id: nil).html_safe
    end

    def jsimple_js_init(name, props: {}, id: nil)
      Jsimple.init(name, props: {}, id: nil).html_safe
    end
  end
end
