require "ec2spec"

module EC2spec
  class CLI < Thor

    desc "list", "Describe instances type spec"
    option :family, :enum => ['general', 'compute', 'memory', 'accelerated', 'storage'], :desc => "Describe instance family spec"
    option :series, :enum => ['t', 'c'], :desc => "Describe instance series spec"
    option :generation, :type => :numeric
    option :type, :desc => "Describe instance type spec"
    def list
      begin
        spec_data = EC2spec::Data.new
        if options.empty?
          spec_array = spec_data.get_all
        elsif options.has_key?('family') && options[:family] != "family"
          spec_array = spec_data.get_family(options[:family])
        elsif (options.has_key?('series') && options[:series] != "series") && (options.has_key?('generation') && options[:generation] != "generation")
          spec_array = spec_data.get_series_and_generation(options[:series], options[:generation])
        elsif options.has_key?('series') && options[:series] != "series"
          spec_array = spec_data.get_series(options[:series])
        elsif options.has_key?('type')
          spec_array = spec_data.get_type(options[:type])
        end
        raise "Can not get spec data." if spec_array.nil? || spec_array.empty?
        table_array = EC2spec::Table.convert(spec_array)
        EC2spec::Table.display(table_array)
      rescue => e
        $stderr.puts("[ERROR] #{e.message}")
        exit 1
      end
    end

  end
end
