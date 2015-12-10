require 'spec_helper'

describe Jsimple do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe 'class methods' do
    describe '#app' do
      it 'returns object with #path method' do
        expect(described_class.app('').respond_to?(:path)).to eq(true)
      end

      it 'returns object with #init method' do
        expect(described_class.app('').respond_to?(:init)).to eq(true)
      end
    end

    it '#init is defined' do
      expect(described_class.respond_to?(:init)).to eq(true)
    end

    it '#path is defined' do
      expect(described_class.respond_to?(:path)).to eq(true)
    end
  end

  describe 'config' do
    before(:each) { described_class.reset! }

    describe 'default value' do
      it 'is defined for host' do
        expect(described_class.host).to eq('localhost')
      end

      it 'is defined for port' do
        expect(described_class.port).to eq('3100')
      end

      it 'is defined for development' do
        expect(described_class.development).to eq(false)
      end

      it 'is defined for js_start_command' do
        expect(described_class.js_start_command).to eq('start')
      end

      it 'is defined for js_path_prefix' do
        expect(described_class.js_path_prefix).to eq('jsimple')
      end

      it 'is defined for js_dev_path_prefix' do
        expect(described_class.js_dev_path_prefix).to eq('')
      end
    end

    it 'can configure host' do
      host = 'watman'
      described_class.host = host
      expect(described_class.host).to eq(host)
    end

    it 'can configure port' do
      port = '8888'
      described_class.port = port
      expect(described_class.port).to eq(port)
    end

    it 'can configure development' do
      development = true
      described_class.development = development
      expect(described_class.development).to eq(development)
    end

    it 'can configure js_start_command' do
      js_start_command = 'startMe'
      described_class.js_start_command = js_start_command
      expect(described_class.js_start_command).to eq(js_start_command)
    end

    it 'can configure js_path_prefix' do
      js_path_prefix = 'my-special-prefix'
      described_class.js_path_prefix = js_path_prefix
      expect(described_class.js_path_prefix).to eq(js_path_prefix)
    end

    it 'can configure js_dev_path_prefix' do
      js_dev_path_prefix = 'my-special-prefix'
      described_class.js_dev_path_prefix = js_dev_path_prefix
      expect(described_class.js_dev_path_prefix).to eq(js_dev_path_prefix)
    end
  end
end
