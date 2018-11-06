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
      return nil if family.nil?
      @spec_data.select {|row| row[:family] == family.to_sym}
    end

    def get_series(series = nil)
      return nil if series.nil?
      @spec_data.select {|row| row[:series] == series.to_sym}
    end

    def get_series_and_generation(series, generation)
      @spec_data.select {|row| row[:series] == series.to_sym && row[:generation] == generation}
    end

    def get_type(type)
      @spec_data.select {|row| row[:type] == type}
    end
  end
end
