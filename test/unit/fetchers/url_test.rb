require "helper"
require "inspec/fetcher" # TODO: require fetcher/url directly

describe Inspec::Fetcher::Url do
  it "registers with the fetchers registry" do
    reg = Inspec::Fetcher::Registry.registry
    _(reg["url"]).must_equal Inspec::Fetcher::Url
  end

  describe "testing different urls" do
    # We don't use the MockLoader here because it produces tarballs
    # with different sha's on each run
    let(:expected_shasum) { "98b1ae45059b004178a8eee0c1f6179dcea139c0fd8a69ee47a6f02d97af1f17" }
    let(:mock_open) do
      m = Minitest::Mock.new
      m.expect :meta, { "content-type" => "application/gzip" }
      m.expect :read, "fake content"
      m
    end

    def expect_url_transform
      @mock_logger = Minitest::Mock.new
      @mock_logger.expect(:warn, nil, [/URL target.*transformed/])

      Inspec::Log.stub :warn, (proc { |message| @mock_logger.warn(message) }) do
        yield
      end

      @mock_logger.verify
    end

    it "handles a http url" do
      url = "http://chef.io/some.tar.gz"
      res = Inspec::Fetcher::Url.resolve(url)
      res.expects(:open).returns(mock_open)
      _(res).must_be_kind_of Inspec::Fetcher::Url
      _(res.resolved_source).must_equal({ url: "http://chef.io/some.tar.gz", sha256: expected_shasum })
    end

    it "handles a https url" do
      url = "https://chef.io/some.tar.gz"
      res = Inspec::Fetcher::Url.resolve(url)
      res.expects(:open).returns(mock_open)
      _(res).must_be_kind_of Inspec::Fetcher::Url
      _(res.resolved_source).must_equal({ url: "https://chef.io/some.tar.gz", sha256: expected_shasum })
    end

    it "handles an https URI" do
      uri = URI.parse("https://chef.io/some.tar.gz")
      res = Inspec::Fetcher::Url.resolve(uri)
      res.expects(:open).returns(mock_open)
      _(res).must_be_kind_of Inspec::Fetcher::Url
      _(res.resolved_source).must_equal({ url: "https://chef.io/some.tar.gz", sha256: expected_shasum })
    end

    it "doesnt handle other schemas" do
      _(Inspec::Fetcher::Url.resolve("gopher://chef.io/some.tar.gz")).must_be_nil
    end

    it "only handles URLs" do
      _(Inspec::Fetcher::Url.resolve(__FILE__)).must_be_nil
    end

    %w{https://github.com/chef/inspec
       https://github.com/chef/inspec.git
       https://www.github.com/chef/inspec.git
       http://github.com/chef/inspec
       http://github.com/chef/inspec.git
       http://www.github.com/chef/inspec.git}.each do |github|
         it "resolves a github url #{github}" do
           expect_url_transform do
             res = Inspec::Fetcher::Url.resolve(github)
             res.expects(:open).returns(mock_open)
             _(res).wont_be_nil
             _(res.resolved_source).must_equal({ url: "https://github.com/chef/inspec/archive/master.tar.gz", sha256: expected_shasum })
           end
         end
       end

    it "resolves a github url with dot" do
      expect_url_transform do
        github = "https://github.com/mitre/aws-rds-oracle-mysql-ee-5.7-cis-baseline"
        res = Inspec::Fetcher::Url.resolve(github)
        res.expects(:open).returns(mock_open)
        _(res).wont_be_nil
        _(res.resolved_source).must_equal({ url: "https://github.com/mitre/aws-rds-oracle-mysql-ee-5.7-cis-baseline/archive/master.tar.gz", sha256: expected_shasum })
      end
    end

    it "resolves a github branch url" do
      expect_url_transform do
        github = "https://github.com/hardening-io/tests-os-hardening/tree/2.0"
        res = Inspec::Fetcher::Url.resolve(github)
        res.expects(:open).returns(mock_open)
        _(res).wont_be_nil
        _(res.resolved_source).must_equal({ url: "https://github.com/hardening-io/tests-os-hardening/archive/2.0.tar.gz", sha256: expected_shasum })
      end
    end

    it "resolves a github commit url" do
      expect_url_transform do
        github = "https://github.com/hardening-io/tests-os-hardening/tree/48bd4388ddffde68badd83aefa654e7af3231876"
        res = Inspec::Fetcher::Url.resolve(github)
        res.expects(:open).returns(mock_open)
        _(res).wont_be_nil
        _(res.resolved_source).must_equal({ url: "https://github.com/hardening-io/tests-os-hardening/archive/48bd4388ddffde68badd83aefa654e7af3231876.tar.gz",
                                            sha256: expected_shasum })
      end
    end

    %w{https://bitbucket.org/chef/inspec
       https://bitbucket.org/chef/inspec.git
       https://www.bitbucket.org/chef/inspec.git
       http://bitbucket.org/chef/inspec
       http://bitbucket.org/chef/inspec.git
       http://www.bitbucket.org/chef/inspec.git}.each do |bitbucket|
         it "resolves a bitbucket url #{bitbucket}" do
           expect_url_transform do
             res = Inspec::Fetcher::Url.resolve(bitbucket)
             res.expects(:open).returns(mock_open)
             _(res).wont_be_nil
             _(res.resolved_source).must_equal({ url: "https://bitbucket.org/chef/inspec/get/master.tar.gz", sha256: expected_shasum })
           end
         end
       end

    it "resolves a bitbucket branch url" do
      expect_url_transform do
        bitbucket = "https://bitbucket.org/chef/inspec/branch/newbranch"
        res = Inspec::Fetcher::Url.resolve(bitbucket)
        res.expects(:open).returns(mock_open)
        _(res).wont_be_nil
        _(res.resolved_source).must_equal({ url: "https://bitbucket.org/chef/inspec/get/newbranch.tar.gz", sha256: expected_shasum })
      end
    end

    it "resolves a bitbucket commit url" do
      expect_url_transform do
        bitbucket = "https://bitbucket.org/chef/inspec/commits/48bd4388ddffde68badd83aefa654e7af3231876"
        res = Inspec::Fetcher::Url.resolve(bitbucket)
        res.expects(:open).returns(mock_open)
        _(res).wont_be_nil
        _(res.resolved_source).must_equal({ url: "https://bitbucket.org/chef/inspec/get/48bd4388ddffde68badd83aefa654e7af3231876.tar.gz", sha256: expected_shasum })
      end
    end

  end

  describe "download_automate2_archive_to_temp" do
    let(:target) { "https://myurl/file.tar.gz" }
    let(:options) do
      {
        "automate" => {
          "ent" => "automate",
          "token_type" => "dctoken",
        },
        "token" => "1234abcd",
        "server_type" => "automate2",
        "profile" => ["admin", "ssh-baseline", "2.0"],
      }
    end
    let(:subject) { Inspec::Fetcher::Url.resolve(target, options) }

    it "downloads tar to tmp file" do
      mock = Object.new
      mock.stubs(:body).returns("this is the body")
      Net::HTTP.expects(:start)
        .returns(mock)

      path = subject.send(:download_automate2_archive_to_temp)
      _(File.read(path)).must_equal "this is the body"
    end

    it "sets default http options" do
      mock = Object.new
      mock.stubs(:body).returns("this is the body")
      opts = { "chef-delivery-enterprise" => "automate", "x-data-collector-token" => "1234abcd", :use_ssl => true, :verify_mode => 1 }
      Net::HTTP.expects(:start)
        .with("myurl", 443, opts)
        .returns(mock)

      subject.send(:download_automate2_archive_to_temp)
    end

    it "sets insecure http options" do
      options["insecure"] = true
      mock = Object.new
      mock.stubs(:body).returns("this is the body")
      opts = { :ssl_verify_mode => 0, "chef-delivery-enterprise" => "automate", "x-data-collector-token" => "1234abcd", :use_ssl => true, :verify_mode => 0 }
      Net::HTTP.expects(:start)
        .with("myurl", 443, opts)
        .returns(mock)

      subject.send(:download_automate2_archive_to_temp)
    end
  end

  describe "applied to a valid url (mocked tar.gz)" do
    let(:mock_file) { MockLoader.profile_tgz("complete-profile") }
    let(:target) { "http://myurl/file.tar.gz" }
    let(:subject) { Inspec::Fetcher::Url.resolve(target) }
    let(:mock_open) do
      m = Minitest::Mock.new
      m.expect :meta, { "content-type" => "application/gzip" }
      m.expect :read, File.open(mock_file, "rb").read
      m
    end

    let(:mock_dest) do
      f = Tempfile.new("url-fetch-test")
      f.path
    end

    it "tries to fetch the file" do
      subject.expects(:open).returns(mock_open)
      subject.fetch(mock_dest)
    end

    it "returns the resolved_source hash" do
      subject.expects(:open).returns(mock_open)
      _(subject.resolved_source[:url]).must_equal(target)
    end
  end

  describe "#http_opts" do
    let(:subject) { Inspec::Fetcher::Url.new("fake_url", config) }

    describe "when username and password is specified" do
      let(:config) { { username: "dummy", password: "dummy" } }
      it "returns a hash containing http_basic_authentication setting" do
        _(subject.send(:http_opts)[:http_basic_authentication]).must_equal %w{dummy dummy}
      end
    end

    describe "when only password is specified" do
      let(:config) { { password: "dummy" } }
      it "returns a hash containing http_basic_authentication setting as nil" do
        _(subject.send(:http_opts)[:http_basic_authentication]).must_be_nil
      end
    end

    describe "when insecure is specified" do
      let(:config) { { "insecure" => true } }
      it "returns a hash containing an ssl_verify_mode setting" do
        _(subject.send(:http_opts)[:ssl_verify_mode]).must_equal OpenSSL::SSL::VERIFY_NONE
      end
    end

    describe "when insecure is not specific" do
      let(:config) { {} }
      it "returns a hash that does not contain an ssl_verify_mode setting" do
        _(subject.send(:http_opts).key?(:ssl_verify_mode)).must_equal false
      end
    end

    describe "when the server is an automate server using dctoken" do
      describe "when the config is properly populated" do
        let(:config) do
          {
            "server_type" => "automate",
            "automate" => {
              "ent" => "my_ent",
              "token_type" => "dctoken",
            },
            "token" => "my_token",
          }
        end

        it "returns a properly formatted headers hash" do
          headers = subject.send(:http_opts)
          _(headers["chef-delivery-enterprise"]).must_equal "my_ent"
          _(headers["x-data-collector-token"]).must_equal "my_token"
        end
      end

      # rubocop:disable Style/BlockDelimiters
      describe "when the enterprise is not supplied" do
        it "raises an exception" do
          _ {
            config = {
              "server_type" => "automate",
              "automate" => { "token_type" => "dctoken" },
              "token" => "my_token",
            }

            Inspec::Fetcher::Url.new("fake_url", config).send(:http_opts)
          }.must_raise Inspec::FetcherFailure
        end
      end

      describe "when the token is not supplied" do
        it "raises an exception" do
          _ {
            config = {
              "server_type" => "automate",
              "automate" => {
                "ent" => "my_ent",
                "token_type" => "dctoken",
              },
            }

            Inspec::Fetcher::Url.new("fake_url", config).send(:http_opts)
          }.must_raise Inspec::FetcherFailure
        end
      end
    end

    describe "when the server is an automate server not using dctoken" do
      describe "when the config is properly populated" do
        let(:config) do
          {
            "server_type" => "automate",
            "automate" => {
              "ent" => "my_ent",
              "token_type" => "usertoken",
            },
            "user" => "my_user",
            "token" => "my_token",
          }
        end
        it "returns a properly formatted headers hash" do
          headers = subject.send(:http_opts)
          _(headers["chef-delivery-enterprise"]).must_equal "my_ent"
          _(headers["chef-delivery-user"]).must_equal "my_user"
          _(headers["chef-delivery-token"]).must_equal "my_token"
        end
      end

      describe "when the user is not supplied" do
        it "raises an exception" do
          _ {
            config = {
              "server_type" => "automate",
              "automate" => {
                "ent" => "my_ent",
                "token_type" => "usertoken",
              },
              "token" => "my_token",
            }

            Inspec::Fetcher::Url.new("fake_url", config).send(:http_opts)
          }.must_raise Inspec::FetcherFailure
        end
      end

      describe "when the token is not supplied" do
        it "raises an exception" do
          _ {
            config = {
              "server_type" => "automate",
              "automate" => {
                "ent" => "my_ent",
                "token_type" => "usertoken",
              },
              "user" => "my_user",
            }

            Inspec::Fetcher::Url.new("fake_url", config).send(:http_opts)
          }.must_raise Inspec::FetcherFailure
        end
      end
    end

    describe "when only a token is supplied" do
      let(:config) { { "token" => "my_token" } }
      it "returns a hash containing an Authorization header" do
        _(subject.send(:http_opts)["Authorization"]).must_equal "Bearer my_token"
      end
    end
  end
end
