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
      if Jsimple.development
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
      _path_join(Jsimple.js_path_prefix, "#{name}.min.js")
    end

    # Path for JS in development
    def self.js_development_path(name, host, port)
      path = _path_join(Jsimple.js_dev_path_prefix, "#{name}.js")
      "http://#{host}:#{port}/#{path}"
    end

    # private

    def self._path_join(path, file_name)
      [path, file_name].reject(&:empty?).join('/')
    end
  end
end
