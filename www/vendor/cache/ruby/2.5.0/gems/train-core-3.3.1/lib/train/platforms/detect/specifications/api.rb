# encoding: utf-8

module Train::Platforms::Detect::Specifications
  class Api
    def self.load
      plat = Train::Platforms

      plat.family("api")

      plat.family("cloud").in_family("api")
      plat.name("aws").in_family("cloud")
      plat.name("azure").in_family("cloud")
      plat.name("gcp").in_family("cloud")
      plat.name("vmware").in_family("cloud")

      plat.family("iaas").in_family("api")
      plat.name("oneview").in_family("iaas")
    end
  end
end
