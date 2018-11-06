RSpec.describe EC2spec::Data do
  before do
    @data = EC2spec::Data.new("spec_data.yml")
    @general_data = [
      {family: :general, series: :t, generation: 2, type: 't2.nano',     cpu: 1,  memory: 0.5,   network: 'Low'},
      {family: :general, series: :t, generation: 2, type: 't2.micro',    cpu: 1,  memory: 1.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.small',    cpu: 1,  memory: 2.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.medium',   cpu: 2,  memory: 4.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.large',    cpu: 2,  memory: 8.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.xlarge',   cpu: 4,  memory: 16.0,  network: 'Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.2xlarge',  cpu: 8,  memory: 32.0,  network: 'Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.nano',     cpu: 2,  memory: 0.5,   network: 'Low'},
      {family: :general, series: :t, generation: 3, type: 't3.micro',    cpu: 2,  memory: 1.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.small',    cpu: 2,  memory: 2.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.medium',   cpu: 2,  memory: 4.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.large',    cpu: 2,  memory: 8.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.xlarge',   cpu: 4,  memory: 16.0,  network: 'Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.2xlarge',  cpu: 8,  memory: 32.0,  network: 'Moderate'},
    ]
    @compute_data = [
      {family: :compute, series: :c, generation: 5, type: 'c5.large',    cpu: 2,  memory: 4.0,   network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.xlarge',   cpu: 4,  memory: 8.0,   network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.2xlarge',  cpu: 8,  memory: 16.0,  network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.4xlarge',  cpu: 16, memory: 32.0,  network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.9xlarge',  cpu: 36, memory: 72.0,  network: '10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.18xlarge', cpu: 72, memory: 144.0, network: '25Gbps'},
    ]
    @memory_data = [
      {family: :memory,  series: :r, generation: 5, type: 'r5.large',    cpu: 2,  memory: 16.0,  network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.xlarge',   cpu: 4,  memory: 32.0,  network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.2xlarge',  cpu: 8,  memory: 64.0,  network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.4xlarge',  cpu: 16, memory: 128.0, network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.12xlarge', cpu: 48, memory: 384.0, network: '10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.24xlarge', cpu: 96, memory: 768.0, network: '25Gbps'},
    ]
    @t_series_data = [
      {family: :general, series: :t, generation: 2, type: 't2.nano',     cpu: 1,  memory: 0.5,   network: 'Low'},
      {family: :general, series: :t, generation: 2, type: 't2.micro',    cpu: 1,  memory: 1.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.small',    cpu: 1,  memory: 2.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.medium',   cpu: 2,  memory: 4.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.large',    cpu: 2,  memory: 8.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.xlarge',   cpu: 4,  memory: 16.0,  network: 'Moderate'},
      {family: :general, series: :t, generation: 2, type: 't2.2xlarge',  cpu: 8,  memory: 32.0,  network: 'Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.nano',     cpu: 2,  memory: 0.5,   network: 'Low'},
      {family: :general, series: :t, generation: 3, type: 't3.micro',    cpu: 2,  memory: 1.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.small',    cpu: 2,  memory: 2.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.medium',   cpu: 2,  memory: 4.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.large',    cpu: 2,  memory: 8.0,   network: 'Low to Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.xlarge',   cpu: 4,  memory: 16.0,  network: 'Moderate'},
      {family: :general, series: :t, generation: 3, type: 't3.2xlarge',  cpu: 8,  memory: 32.0,  network: 'Moderate'},
    ]
    @c_series_data = [
      {family: :compute, series: :c, generation: 5, type: 'c5.large',    cpu: 2,  memory: 4.0,   network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.xlarge',   cpu: 4,  memory: 8.0,   network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.2xlarge',  cpu: 8,  memory: 16.0,  network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.4xlarge',  cpu: 16, memory: 32.0,  network: 'MAX 10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.9xlarge',  cpu: 36, memory: 72.0,  network: '10Gbps'},
      {family: :compute, series: :c, generation: 5, type: 'c5.18xlarge', cpu: 72, memory: 144.0, network: '25Gbps'},
    ]
    @r_series_data = [
      {family: :memory,  series: :r, generation: 5, type: 'r5.large',    cpu: 2,  memory: 16.0,  network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.xlarge',   cpu: 4,  memory: 32.0,  network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.2xlarge',  cpu: 8,  memory: 64.0,  network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.4xlarge',  cpu: 16, memory: 128.0, network: 'MAX 10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.12xlarge', cpu: 48, memory: 384.0, network: '10Gbps'},
      {family: :memory,  series: :r, generation: 5, type: 'r5.24xlarge', cpu: 96, memory: 768.0, network: '25Gbps'},
    ]
  end


  it "get_all return SPEC_DATA" do
    expect(@data.get_all).to be @data.spec_data
  end

  describe 'get_family' do
    it "If not provided any arugment for get_family, return nil" do
      expect(@data.get_family).to be nil
    end

    it "get_famliy(general) return only general family SPEC_DATA" do
      expect(@data.get_family("general")).to eq @general_data
    end

    it "get_famliy(compute) return only compute family SPEC_DATA" do
      expect(@data.get_family("compute")).to eq @compute_data
    end

    it "get_famliy(memory) return only memory family SPEC_DATA" do
      expect(@data.get_family("memory")).to eq @memory_data
    end
  end

  describe 'get_series' do
    it "If not provided any arugment for get_series, return nil" do
      expect(@data.get_series).to be nil
    end

    it "get_series(t) reuturn only t series SPEC_DATA" do
      expect(@data.get_series("t")).to eq @t_series_data
    end

    it "get_series(c) reuturn only c series SPEC_DATA" do
      expect(@data.get_series("c")).to eq @c_series_data
    end

    it "get_series(r) reuturn only r series SPEC_DATA" do
      expect(@data.get_series("r")).to eq @r_series_data
    end
  end
end
