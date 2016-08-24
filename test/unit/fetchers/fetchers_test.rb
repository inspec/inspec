# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe Inspec::Fetcher do
  it 'loads the local fetcher for this file' do
    res = Inspec::Fetcher.resolve(__FILE__)
    res.must_be_kind_of Fetchers::Local
  end

  it 'is able to handle Windows paths' do
    # simulate a local windows path
    file = __FILE__
    file.tr!('/', '\\')
    res = Inspec::Fetcher.resolve(file)
    res.must_be_kind_of Fetchers::Local
    res.target.must_equal __FILE__
  end
end

describe Inspec::Plugins::RelFetcher do
  def fetcher
    src_fetcher.expects(:files).returns(in_files).at_least_once
    Inspec::Plugins::RelFetcher.new(src_fetcher)
  end

  let(:src_fetcher) { mock() }

  IN_AND_OUT = {
    []                           => [],
    %w{file}                     => %w{file},
    # don't prefix just by filename
    %w{file file_a}              => %w{file file_a},
    %w{path/file path/file_a}    => %w{file file_a},
    %w{path/to/file}             => %w{file},
    %w{/path/to/file}            => %w{file},
    %w{alice bob}                => %w{alice bob},
    # mixed paths
    %w{x/a y/b}                  => %w{x/a y/b},
    %w{/x/a /y/b}                => %w{x/a y/b},
    %w{z/x/a z/y/b}              => %w{x/a y/b},
    %w{/z/x/a /z/y/b}            => %w{x/a y/b},
    # mixed with relative path
    %w{a path/to/b}              => %w{a path/to/b},
    %w{path/to/b a}              => %w{path/to/b a},
    %w{path/to/b path/a}         => %w{to/b a},
    %w{path/to/b path/a c}       => %w{path/to/b path/a c},
    # mixed with absolute paths
    %w{/path/to/b /a}            => %w{path/to/b a},
    %w{/path/to/b /path/a}       => %w{to/b a},
    %w{/path/to/b /path/a /c}    => %w{path/to/b path/a c},
    # mixing absolute and relative paths
    %w{path/a /path/b}           => %w{path/a /path/b},
    %w{/path/a path/b}           => %w{/path/a path/b},
    # extract folder structure buildup
    %w{/a /a/b /a/b/c}           => %w{c},
    %w{/a /a/b /a/b/c/d/e}       => %w{e},
    # ignore pax_global_header, which are commonly seen in github tars and are not
    # ignored by all tar streaming tools, its not extracted by GNU tar since 1.14
    %w{/pax_global_header /a/b}  => %w{b},
    %w{pax_global_header a/b}    => %w{b},
  }.each do |ins, outs|
    describe 'empty profile' do
      let(:in_files) { ins }

      it 'also has no files' do
        fetcher.files.must_equal outs
      end
    end
  end

end
