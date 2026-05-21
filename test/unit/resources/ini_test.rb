# frozen_string_literal: true

require 'helper'
require 'inspec/resource'
require 'inspec/resources/ini'

# Unit tests for Inspec::Resources::IniConfig.
#
# All tests use MockLoader with the fixture file test/fixtures/files/rootwrap.conf
# so they run fully offline with no real filesystem or network access.
describe 'Inspec::Resources::Ini' do
  # Shared resource instance loaded once per test via let().
  let(:resource) { MockLoader.new(:ubuntu).load_resource('ini', 'rootwrap.conf') }

  # Verifies end-to-end parsing: params hash shape, nested value lookup,
  # and resource_id equals the supplied file path.
  it 'check ini parsing on ubuntu' do
    result = { 'DEFAULT' => { 'filters_path' => '/etc/cinder/rootwrap.d,/usr/share/cinder/rootwrap',
                              'exec_dirs' => '/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin' } }
    _(resource.params).must_equal result
    _(resource.value(%w[DEFAULT exec_dirs])).must_equal '/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin'
    _(resource.resource_id).must_equal 'rootwrap.conf'
  end

  # ObjectTraverser returns nil (not raise) when a key path is absent.
  # Guards against regressions that might raise KeyError instead.
  it 'returns nil for a key path that does not exist in the file' do
    _(resource.value(%w[DEFAULT nonexistent_key])).must_be_nil
  end

  # Pins the resource_base_name contract: JsonConfig#to_s must read "INI <path>".
  # Failure here means the label used in test output / error messages has changed.
  it 'to_s includes the INI resource base name and file path' do
    _(resource.to_s).must_equal 'INI rootwrap.conf'
  end

  # Negative test: parse must raise ResourceFailed on nil content rather than
  # silently returning {}, which would mask unreadable-file errors from the caller.
  it 'raises ResourceFailed when file content is nil' do
    err = _(proc { resource.send(:parse, nil) }).must_raise Inspec::Exceptions::ResourceFailed
    _(err.message).must_include 'nil'
  end

  # Structured logging — ok path:
  # parse must emit one debug log entry that is valid JSON containing
  # op="ini_parse", status="ok", a numeric elapsed_ms, and a keys count.
  it 'emits a structured JSON debug log entry on successful parse' do
    resource # force let() to initialize before the stub starts capturing
    logged = []
    Inspec::Log.stub(:debug, ->(msg) { logged << msg }) do
      resource.send(:parse, "[S]\nk=v\n")
    end
    _(logged.size).must_equal 1
    entry = JSON.parse(logged.first)
    _(entry['op']).must_equal 'ini_parse'
    _(entry['status']).must_equal 'ok'
    _(entry['elapsed_ms']).must_be :>=, 0
    _(entry['keys']).must_equal 1
  end

  # Structured logging — failure path:
  # parse must emit a debug log entry with status="failed" and an error field
  # before re-raising as ResourceFailed.
  it 'emits a structured JSON debug log entry with status=failed on parse error' do
    resource # force let() to initialize before the stub starts capturing
    logged = []
    SimpleConfig.stub(:new, ->(_) { raise 'simulated parse error' }) do
      Inspec::Log.stub(:debug, ->(msg) { logged << msg }) do
        _(proc { resource.send(:parse, '[broken]') }).must_raise Inspec::Exceptions::ResourceFailed
      end
    end
    _(logged.size).must_equal 1
    entry = JSON.parse(logged.first)
    _(entry['op']).must_equal 'ini_parse'
    _(entry['status']).must_equal 'failed'
    _(entry['elapsed_ms']).must_be :>=, 0
    _(entry['error']).must_include 'simulated parse error'
  end

  # Resilience test — non-UTF-8 encoding (e.g. CP1252/Latin-1 from Windows targets):
  # Without the encode() guard, SimpleConfig passes bytes through as ASCII-8BIT.
  # JSON.generate on the result then raises JSON::GeneratorError: "\xE9" from ASCII-8BIT to UTF-8.
  # With the fix, the parse succeeds and the result is JSON-serializable.
  it 'parses content containing non-UTF-8 bytes without raising' do
    latin1_content = (+"[S]\nk=caf\xe9\n").force_encoding('BINARY')
    result = resource.send(:parse, latin1_content)
    _(result).must_be_kind_of Hash
    # JSON.generate would raise JSON::GeneratorError without the encode() fix
    _(JSON.generate(result)).must_be_kind_of String
  end

  # Encoding replacement contract:
  # Bytes that cannot be represented in UTF-8 are replaced with '?'.
  # This documents the lossy-but-safe behaviour so operators know what to expect
  # when auditing legacy Windows INI files with accented characters.
  it 'replaces non-UTF-8 bytes with ? in parsed values' do
    # \xe9 is é in Latin-1; invalid as a standalone byte in UTF-8
    content = (+"[S]\nkey=caf\xe9\n").force_encoding('BINARY')
    result = resource.send(:parse, content)
    _(result['S']['key']).must_equal 'caf?'
  end
end
