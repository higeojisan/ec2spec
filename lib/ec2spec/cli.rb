require "ec2spec"

module EC2spec
  class CLI < Thor

    HEADERS = [:type, :cpu, :memory, :network]

    desc "list", "Describe instances type spec"
    option :family, :desc => "Describe instance family spec"
    def list
      spec_data = EC2spec::Data.new
      spec_array = spec_data.get_all if options.empty?
      spec_array = spec_data.get_family(options[:family]) if options[:family]
    end

  end
end
