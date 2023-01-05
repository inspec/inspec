require "functional/helper"

describe "attestations" do
  include FunctionalHelper

  parallelize_me!

  let(:attestation_profile) { "#{profile_path}/attestation" }
  let(:run_result)            { run_inspec_process(cmd) }
  let(:cmd)                   { "exec #{attestation_profile} --attestation-file #{attestation_profile}/files/#{attestation_file}" }

  attr_accessor :out

  def inspec(commandline, prefix = nil)
    @stdout = @stderr = nil
    self.out = super
  end

  def stdout
    @stdout ||= out.stdout
      .force_encoding(Encoding::UTF_8)
  end

  def stderr
    @stderr ||= out.stderr
      .force_encoding(Encoding::UTF_8)
  end

  describe "with a attestation file that does not exist" do
    let(:attestation_file) { "no_file.yaml" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stderr, "no_file.yaml does not exist"
      assert_equal 1, result.exit_status
    end
  end

  describe "with a attestation file that has wrong headers - yaml format" do
    let(:attestation_file) { "wrong-headers.yaml" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stdout, "Extra column headers: [\"random\"]"
    end
  end

  describe "with a attestation file that has wrong headers - csv format" do
    let(:attestation_file) { "wrong-headers.csv" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stdout, "Missing column headers: [\"control_id\", \"status\", \"justification\"]"
      assert_includes result.stdout, "Extra column headers: [\"control_id_random\", \"justification_random\", \"run_random\", \"expiration_date_random\", nil]\n"
    end
  end

  describe "with a attestation file that has wrong headers - json format" do
    let(:attestation_file) { "wrong-headers.json" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stdout, "Extra column headers: [\"random\"]"
    end
  end

  describe "running attestation on a profile - yaml" do
    let(:attestation_file) { "attestations.yaml" }

    it "attests N/R controls correctly" do
      result = run_result
      assert_includes result.stdout, "tmp-3.0.1: No-op (1 failed)"
      refute_includes result.stdout, "N/R  tmp-3.0.2: No-op"
      refute_includes result.stdout, "N/R  tmp-6.0.2: No-op"
    end

    it "does not attests non N/R controls" do
      result = run_result
      assert_includes result.stdout, "tmp-4.0: d.1 (1 failed)"
    end
  end

  describe "running attestation on a profile - json" do
    let(:attestation_file) { "attestations.json" }

    it "attests N/R controls correctly" do
      result = run_result
      assert_includes result.stdout, "tmp-3.0.1: No-op (1 failed)"
      refute_includes result.stdout, "N/R  tmp-3.0.2: No-op"
      refute_includes result.stdout, "N/R  tmp-6.0.2: No-op"
    end

    it "does not attests non N/R controls" do
      result = run_result
      assert_includes result.stdout, "tmp-4.0: d.1 (1 failed)"
    end
  end

  describe "running attestation on a profile - csv" do
    let(:attestation_file) { "attestations.csv" }

    it "attests N/R controls correctly" do
      result = run_result
      assert_includes result.stdout, "tmp-3.0.1: No-op (1 failed)"
      refute_includes result.stdout, "N/R  tmp-3.0.2: No-op"
      refute_includes result.stdout, "N/R  tmp-6.0.2: No-op"
    end

    it "does not attests non N/R controls" do
      result = run_result
      assert_includes result.stdout, "tmp-4.0: d.1 (1 failed)"
    end
  end

  describe "running attestation on profile with streaming reporter" do
    let(:attestation_file) { "#{attestation_profile}/files/attestations.yaml" }
    it "attests controls correctly" do
      inspec("exec " + "#{attestation_profile}" + " --attestation-file #{attestation_file}" + " --no-create-lockfile" + " --no-color" + " --reporter progress-bar")
      if windows?
        _(stderr).must_match(/\[FAIL\]\s*tmp-3.0.1\s*No-op Skipped control due to only_if condition.  Control not attested : Attestation expired on 2021-12-01/)
        _(stderr).must_match(/\[FAIL\]\s*tmp-3.0.2\s*No-op Skipped control due to only_if condition.  Control not attested : Attestation expired on 2001-06-01/)
        _(stderr).must_match(/\[PASS\]\s*tmp-6.0.2\s*No-op Skipped control due to only_if condition.  Control Attested : Sheer cleverness | Evidence URL: Dummy url/)
        _(stderr).must_match(/\[FAIL\]\s*tmp-4.0\s*d.1 is expected to cmp == \"d.1\"/)
      else
        _(stderr).must_match(/\[FAILED\]\s*tmp-3.0.1\s*No-op Skipped control due to only_if condition.  Control not attested : Attestation expired on 2021-12-01/)
        _(stderr).must_match(/\[FAILED\]\s*tmp-3.0.2\s*No-op Skipped control due to only_if condition.  Control not attested : Attestation expired on 2001-06-01/)
        _(stderr).must_match(/\[PASSED\]\s*tmp-6.0.2\s*No-op Skipped control due to only_if condition.  Control Attested : Sheer cleverness | Evidence URL: Dummy url/)
        _(stderr).must_match(/\[FAILED\]\s*tmp-4.0\s*d.1 is expected to cmp == \"d.1\"/)
      end
    end
  end

  describe "an attestation file with invalid dates" do
    let(:attestation_file) { "bad-date.yaml" }
    it "gracefully errors" do
      result = run_result
      assert_includes result.stdout, "ERROR"
    end
  end

  describe "an attestation file with invalid update dates" do
    let(:attestation_file) { "bad-update-date.yaml" }
    it "gracefully errors" do
      result = run_result
      assert_includes result.stdout, "ERROR"
    end
  end

  describe "an attestation file with invalid status" do
    let(:attestation_file) { "invalid-status.yaml" }
    it "throws warning" do
      result = run_result
      assert_includes result.stdout, "Invalid attestation status 'pass' for control tmp-3.0.3. Use 'passed' or 'failed'."
    end
  end

  describe "an attestation file with no status" do
    let(:attestation_file) { "no-status.yaml" }
    it "throws warning" do
      result = run_result
      assert_includes result.stdout, "No attestation status for control tmp-3.0.3. Use 'passed' or 'failed'."
    end
  end

  describe "an attestation file with invalid frequency value" do
    let(:attestation_file) { "invalid-frequency.yaml" }
    it "throws warning" do
      result = run_result
      assert_includes result.stdout, "Invalid frequency value 'biweekly' for control tmp-3.0.4."
    end
  end

  describe "an attestation file with no justification" do
    let(:attestation_file) { "no-justification.yaml" }
    it "throws warning and shows proper message for justification absence" do
      result = run_result
      assert_includes result.stdout, "Missing column headers: [\"justification\"]"
      assert_includes result.stdout, "Control Attested : No justification provided."
    end
  end
end