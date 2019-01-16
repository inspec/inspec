control "aws_cloudtrail_trails recall" do
  describe aws_cloudtrail_trails do
    it { should exist }
  end
end
