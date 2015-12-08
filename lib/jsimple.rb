require 'jsimple/version'

require 'jsimple/builder'
require 'jsimple/railtie' if defined?(Rails)

require 'hot_reload_proxy'

module Jsimple
  def self.app(name, props: {}, id: nil)
    Builder.app_factory(name, props, id)
  end

  # Config
  DEFAULT_HOST = 'localhost'
  DEFAULT_PORT = '3100'
  DEFAULT_DEVELOPMENT = defined?(Rails) ? Rails.env.development? : false
  DEFAULT_JS_START_COMMAND = 'start'
  @host = DEFAULT_HOST
  @port = DEFAULT_PORT
  @development = DEFAULT_DEVELOPMENT
  @js_start_command = DEFAULT_JS_START_COMMAND

  def self.host=(host)
    HotReloadProxy::Config.host = host
    @host = host
  end

  def self.port=(port)
    HotReloadProxy::Config.port = port
    @port = port
  end

  def self.development=(development)
    @development = development
  end

  def self.js_start_command=(js_start_command)
    @js_start_command = js_start_command
  end

  def self.host
    @host
  end

  def self.port
    @port
  end

  def self.development
    @development
  end

  def self.js_start_command
    @js_start_command
  end

  def self.reset!
    @host = DEFAULT_HOST
    @port = DEFAULT_PORT
    @development = DEFAULT_DEVELOPMENT
    @js_start_command = DEFAULT_JS_START_COMMAND
  end
end
