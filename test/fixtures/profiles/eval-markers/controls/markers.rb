# This profile emits markers to STDERR at various points to indicate that it was evaluated

$stderr.puts "TOP_LEVEL_MARKER"
$stderr.puts "EVALUATION_MARKER"
control "my-dummy-control" do
  $stderr.puts "CONTROL_BODY_MARKER"
  title "#{$stderr.puts "METADATA_MARKER"}"
  describe true do
    $stderr.puts "DESCRIBE_BODY_MARKER"
    it do
      $stderr.puts "IT_BODY_MARKER"
      should be_truthy
    end
  end
end