module EC2spec
  class Table
    def self.convert(spec_array)
      table_array = []
      spec_array.each do |spec|
        tmp_array = []
        tmp_array << spec[:type]
        tmp_array << spec[:cpu]
        tmp_array << spec[:memory]
        tmp_array << spec[:network]
        table_array << tmp_array
        table_array << :separator
      end
      table_array.pop
      table_array
    end

    def self.display(table_array)
      table = Terminal::Table.new :headings => ['Instance type', 'vCPU', 'memory(GiB)', 'networking performance'], :rows => table_array
      puts table
    end
  end
end
