require 'jsimple/version'

require 'jsimple/builder'

require 'hot_reload_proxy'

module Jsimple
  def self.app(name, props: {}, id: nil)
    Builder.app_factory(name, props, id)
  end

  # Config
  @host = 'localhost'
  @port = '3100'
  @development = defined?(Rails) ? Rails.env.development? : false
  @js_start_command = 'start'

  def self.host=(host)
    HotReloadProxy::Proxy.foreign_host = host
    @host = host
  end

  def self.port=(port)
    HotReloadProxy::Proxy.foreign_port = port
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
end
