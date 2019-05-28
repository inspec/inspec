# author: Christoph Hartmann
# author: Dominik Richter
class Spdx
  def self.licenses
    spdx_file = File.join(File.dirname(__FILE__), 'spdx.txt').freeze
    File.read(spdx_file).split("\n")
  end

  def self.valid_license?(license)
    licenses.include?(license)
  end
end
