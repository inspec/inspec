require "functional/helper"

describe "attestations" do
  include FunctionalHelper

  parallelize_me!

  let(:enhanced_outcome_profiles_path) { "#{profile_path}/enhanced-outcomes-test" }
  let(:run_result)            { run_inspec_process(cmd, json: true) }
  let(:cmd)                   { "exec #{enhanced_outcome_profiles_path} --attestation-file #{enhanced_outcome_profiles_path}/files/#{attestation_file}" }
  let(:controls_by_id)        { run_result; @json.dig("profiles", 0, "controls").map { |c| [c["id"], c] }.to_h }


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
      assert_includes result.stderr, "Extra column headers: [\"random\"]"
    end
  end

  describe "with a attestation file that has wrong headers - csv format" do
    let(:attestation_file) { "wrong-headers.csv" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stderr, "Missing column headers: [\"control_id\", \"justification\"]"
      assert_includes result.stderr, "Extra column headers: [\"control_id_random\", \"justification_random\", \"run_random\", \"expiration_date_random\", nil]\n"
    end
  end

  describe "with a attestation file that has wrong headers - json format" do
    let(:attestation_file) { "wrong-headers.json" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stderr, "Extra column headers: [\"random\"]"
    end
  end

  describe "with a attestation file that has wrong headers - xlsx format" do
    let(:attestation_file) { "wrong-headers.xlsx" }
    it "raise file does not exist standard error" do
      result = run_result
      assert_includes result.stderr, "Missing column headers: [\"control_id\", \"justification\"]"
      assert_includes result.stderr, "Extra column headers: [\"control_id_random\", \"justification_random\", \"run_random\", \"expiration_date_random\"]\n"
    end
  end

  describe "it attests the N/R controls" do
    let(:attestation_file) { "attestations.yaml" }
    let(:result) {run_result }
    it "passes the N/R" do
      # to do
    end

    it "fails the N/R" do
      # to do
    end
  end

  describe "it does not attest non N/R controls" do
    # to do
  end
end