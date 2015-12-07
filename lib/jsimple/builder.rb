require 'json'

module Jsimple
  class Builder
    # Data holder for the JS app path and initializer
    App = Struct.new(:init, :path)
    class App
    end

    def self.app_factory(name, props, id)
      App.new(init_js(name, props, id), js_path(name))
    end

    def self.js_path(name)
      if development_mode?
        js_development_path(name, Jsimple.host, Jsimple.port)
      else
        js_production_path(name)
      end
    end

    def self.init_js(name, props, id)
      dom_element = "document.getElementById('#{id || name}')"
      js_object = "JSON.parse('#{JSON.dump(props)}')"
      #  <script>
      #    ExampleName.start(document.getElementById('ExampleName'), JSON.parse('{}'));
      #  </script>
      "<script>#{name}.#{Jsimple.js_start_command}(#{dom_element}, #{js_object});</script>"
    end

    # Path for JS bundle in production
    def self.js_production_path(name)
      "jsimple/#{name}.min.js"
    end

    # Path for JS in development
    def self.js_development_path(name, host, port)
      "http://#{host}:#{port}/#{name}.js"
    end

    # Are we in development mode?
    def self.development_mode?
      Jsimple.development
    end
  end
end
