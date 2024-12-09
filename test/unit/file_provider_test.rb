require "helper"
require "inspec/file_provider" # TODO: split

describe Inspec::MockProvider do
  let(:subject) { Inspec::MockProvider.new(target) }

  describe "without data" do
    let(:target) { { mock: {} } }
    it "has no files on empty" do
      _(subject.files).must_equal []
    end
  end

  describe "with_data" do
    let(:file_name) { rand.to_s }
    let(:file_content) { rand.to_s }
    let(:target) { { mock: { file_name => file_content } } }

    it "has files" do
      _(subject.files).must_equal [file_name]
    end

    it "can read a file" do
      _(subject.read(file_name)).must_equal file_content
    end
  end
end

describe Inspec::DirProvider do
  let(:subject) { Inspec::DirProvider.new(target) }

  describe "applied to this file" do
    let(:target) { __FILE__ }

    it "must only contain this file" do
      _(subject.files).must_equal [__FILE__]
    end

    it "must not read if the file doesnt exist" do
      _(subject.read("file-does-not-exist")).must_be_nil
    end

    it "must not read files not covered" do
      not_covered = File.expand_path("../helper.rb", __dir__)
      _(File.file?(not_covered)).must_equal true
      _(subject.read(not_covered)).must_be_nil
    end

    it "must read the contents of the file" do
      _(subject.read(__FILE__)).must_equal File.read(__FILE__)
    end
  end

  describe "applied to this folder" do
    let(:target) { File.dirname(__FILE__) }

    it "must contain all files" do
      _(subject.files).must_include __FILE__
    end

    it "must not read if the file doesnt exist" do
      _(subject.read("file-not-in-folder")).must_be_nil
    end

    it "must not read files not covered" do
      not_covered = File.expand_path("../helper.rb", __dir__)
      _(File.file?(not_covered)).must_equal true
      _(subject.read(not_covered)).must_be_nil
    end

    it "must read the contents of the file" do
      _(subject.read(__FILE__)).must_equal File.read(__FILE__)
    end
  end
end

describe Inspec::ZipProvider do
  let(:subject) { Inspec::ZipProvider.new(target) }

  describe "applied to a tar archive" do
    let(:target) { MockLoader.profile_zip("complete-profile") }

    it "must contain all files" do
      _(subject.files.sort).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/host_spec.rb files files/a_sub_dir
        files/a_sub_dir/sub_items.conf files/items.conf}.sort
    end

    it "must not read if the file isnt included" do
      _(subject.read("file-not-in-archive")).must_be_nil
    end

    it "must read the contents of the file" do
      _(subject.read("inspec.yml")).must_match(/^name: complete$/)
    end
  end

  describe "applied to a zip with an empty filename" do
    # Just a placeholder, it will be ignored anyway:
    let(:cls) do
      class MockZipProvider < Inspec::ZipProvider
        Entry = Struct.new(:name)
        class List < Array
          alias :get_next_entry :pop
        end

        private

        def walk_zip(path, &callback)
          list = List.new([Entry.new(""), Entry.new("zipzip"), Entry.new("")])
          yield(list)
        end
      end
      MockZipProvider
    end

    it "must contain all files" do
      _(cls.new(rand.to_s).files).must_equal %w{zipzip}
    end
  end

  describe "paths outside of the archive ignored" do
    # This is to test for the zipslip vulnerability
    let(:cls) do
      class MockZipSlipZipProvider < Inspec::ZipProvider
        Entry = Struct.new(:name)
        class List < Array
          alias :get_next_entry :pop
        end

        private

        def walk_zip(path, &callback)
          list = List.new([Entry.new("../../blah"), Entry.new("zipzip"), Entry.new("../../haha")])
          yield(list)
        end
      end
      MockZipSlipZipProvider
    end

    it "must contain all files" do
      _(cls.new(rand.to_s).files).must_equal %w{zipzip}
    end
  end
end

describe Inspec::ZipProvider do
  let(:subject) { Inspec::ZipProvider.new(target) }

  describe "applied to a tar archive" do
    let(:target) { MockLoader.profile_zip("complete-profile") }

    it "must contain all files" do
      _(subject.files.sort).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/host_spec.rb files files/a_sub_dir
        files/a_sub_dir/sub_items.conf files/items.conf}.sort
    end

    it "must not read if the file isnt included" do
      _(subject.read("file-not-in-archive")).must_be_nil
    end

    it "must read the contents of the file" do
      _(subject.read("inspec.yml")).must_match(/^name: complete$/)
    end
  end
end

describe Inspec::TarProvider do
  let(:subject) { Inspec::TarProvider.new(target) }

  describe "applied to a tar archive" do
    let(:target) { MockLoader.profile_tgz("complete-profile") }

    it "must contain all files" do
      _(subject.files.sort).must_equal %w{inspec.yml libraries/testlib.rb
        controls/host_spec.rb files/a_sub_dir/sub_items.conf
        files/items.conf}.sort
    end

    it "must not read if the file isnt included" do
      _(subject.read("file-not-in-archive")).must_be_nil
    end

    it "must read the contents of the file" do
      _(subject.read("inspec.yml")).must_match(/^name: complete$/)
    end

    it "deals with empty files in tarballs correctly" do
      path = "test/fixtures/contains-empty-file-0.1.0.tar.gz"
      f = Inspec::FileProvider.for_path(path)
      _(f.files.grep(/empty/)).wont_be_empty
    end
  end

  Entry = Struct.new(:full_name) do
    def file?; true; end

    def read; ""; end
  end

  describe "applied to a tar with an empty filename" do
    # Just a placeholder, it will be ignored anyway:
    let(:cls) do
      class MockTarProvider < Inspec::TarProvider
        def walk_tar(path, &callback)
          paths = ["", "tartar", ""]
          yield paths.map { |s| Entry.new s }
        end
      end
      MockTarProvider
    end

    it "must contain all files" do
      _(cls.new(rand.to_s).files).must_equal %w{tartar}
    end
  end

  describe "applied to a tar with paths above dir" do
    let(:cls) do
      class MockZipSlipTarProvider < Inspec::TarProvider
        def walk_tar(path, &callback)
          paths = ["", "tartar", ""]
          yield paths.map { |s| Entry.new s }
        end
      end
      MockZipSlipTarProvider
    end

    it "must not contain all files" do
      _(cls.new(rand.to_s).files).must_equal %w{tartar}
    end
  end

end

describe Inspec::RelativeFileProvider do
  def fetcher
    src_fetcher.expects(:files).returns(in_files).at_least_once
    Inspec::RelativeFileProvider.new(src_fetcher)
  end

  let(:src_fetcher) { mock }

  IN_AND_OUT = {
    [] => [],
    %w{file} => %w{file},
    # don't prefix just by filename
    %w{file file_a} => %w{file file_a},
    %w{path/file path/file_a} => %w{file file_a},
    %w{path/to/file} => %w{file},
    %w{/path/to/file} => %w{file},
    %w{alice bob} => %w{alice bob},
    # mixed paths
    %w{x/a y/b} => %w{x/a y/b},
    %w{/x/a /y/b} => %w{x/a y/b},
    %w{z/x/a z/y/b} => %w{x/a y/b},
    %w{/z/x/a /z/y/b} => %w{x/a y/b},
    # mixed with relative path
    %w{a path/to/b} => %w{a path/to/b},
    %w{path/to/b a} => %w{path/to/b a},
    %w{path/to/b path/a} => %w{to/b a},
    %w{path/to/b path/a c} => %w{path/to/b path/a c},
    # When the first element is the directory
    %w{path/ path/to/b path/a} => %w{to/b a},
    %w{path path/to/b path/a} => %w{to/b a},
    # mixed with absolute paths
    %w{/path/to/b /a} => %w{path/to/b a},
    %w{/path/to/b /path/a} => %w{to/b a},
    %w{/path/to/b /path/a /c} => %w{path/to/b path/a c},
    # mixing absolute and relative paths
    %w{path/a /path/b} => %w{path/a /path/b},
    %w{/path/a path/b} => %w{/path/a path/b},
    # extract folder structure buildup
    %w{/a /a/b /a/b/c} => %w{c},
    %w{/a /a/b /a/b/c/d/e} => %w{e},
    # extract folder structure buildup (relative)
    %w{a a/b a/b/c} => %w{c},
    %w{a a/b a/b/c/d/e} => %w{e},
    # extract folder structure buildup (relative)
    %w{a/ a/b/ a/b/c} => %w{c},
    %w{a/ a/b/ a/b/c/d/e} => %w{e},
    # ignore pax_global_header, which are commonly seen in github tars and are not
    # ignored by all tar streaming tools, its not extracted by GNU tar since 1.14
    %w{/pax_global_header /a/b} => %w{b},
    %w{pax_global_header a/b} => %w{b},
  }.each do |ins, outs|
    describe "empty profile" do
      let(:in_files) { ins }

      it "turns #{ins} into #{outs}" do
        _(fetcher.files).must_equal outs
      end
    end
  end

end

describe Inspec::GemProvider do
  let(:gem_info) { { gem: "test-dummy-gem" } }
  let(:subject) { Inspec::GemProvider.new(gem_info) }

  describe "when gem does not exists" do
    it "throws gem dependency exception" do
      assert_raises(Inspec::Exceptions::GemDependencyNotFound) { subject.files }
    end
  end
end
