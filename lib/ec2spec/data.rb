module EC2spec
  class Data
    attr_reader :spec_data

    def initialize(file)
      @spec_data = YAML.load_file("./#{file}")
    end

    def get_all
      @spec_data
    end

    def get_family(family = nil)
      case family
      when "general"
        @spec_data.select {|row| row[:family] == :general}
      when "compute"
        @spec_data.select {|row| row[:family] == :compute}
      when "memory"
        @spec_data.select {|row| row[:family] == :memory}
      else
        nil
      end
    end

    def get_series(series = nil)
      case series
      when "t"
        @spec_data.select {|row| row[:series] == :t}
      when "c"
        @spec_data.select {|row| row[:series] == :c}
      when "r"
        @spec_data.select {|row| row[:series] == :r}
      else
        nil
      end
    end

    def get_series_and_generation(series, generation)
      @spec_data.select {|row| row[:series] == series.to_sym && row[:generation] == generation}
    end

    def get_type(type)
      @spec_data.select {|row| row[:type] == type}
    end
  end
end
