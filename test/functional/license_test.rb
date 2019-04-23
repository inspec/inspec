require 'functional/helper'

describe 'The license acceptance mechanism' do
  include FunctionalHelper

  describe 'when the user passes the --chef-license accept flag' do
    it 'should silently work normally' do
      Dir.mktmpdir do |tmp_home|
        run_result = run_inspec_process('shell -c platform.family --chef-license accept', env: { 'HOME' => tmp_home })
        run_result.stdout.wont_include 'Chef License Acceptance' # --chef-license should not mention accepting the license
        run_result.stderr.must_equal ''

        run_result.exit_status.must_equal 0
      end
    end
  end
end
