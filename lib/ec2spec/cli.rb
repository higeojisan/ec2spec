require "ec2spec"

module EC2spec
  class CLI < Thor
    HEADERS = [:type, :cpu, :memory, :network]

    desc "list", "Describe instances type spec"
    option :family, :desc => "Describe instance family spec"
    def list
      spec_data = EC2spec::SPEC_DATA if options.empty?
      spec_data = get_family(options[:family]) if options[:family]
      p spec_data
    end

    no_commands do
      def get_family(family)
        case family
        when "general"
          EC2spec::SPEC_DATA.select {|row| row[:family] == :general}
        when "compute"
          EC2spec::SPEC_DATA.select {|row| row[:family] == :compute}
        else
         "test"
        end
      end
    end

  end
end
