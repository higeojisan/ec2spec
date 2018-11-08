RSpec.describe EC2spec::CLI do
  ALL_DATA = <<~"EOS"
  +---------------+------+-------------+------------------------+
  | Instance type | vCPU | memory(GiB) | networking performance |
  +---------------+------+-------------+------------------------+
  | t2.nano       | 1    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t2.micro      | 1    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.small      | 1    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t2.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.nano       | 2    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t3.micro      | 2    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.small      | 2    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | c5.large      | 2    | 4.0         | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | c5.xlarge     | 4    | 8.0         | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | c5.2xlarge    | 8    | 16.0        | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | c5.4xlarge    | 16   | 32.0        | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | c5.9xlarge    | 36   | 72.0        | 10Gbps                 |
  +---------------+------+-------------+------------------------+
  | c5.18xlarge   | 72   | 144.0       | 25Gbps                 |
  +---------------+------+-------------+------------------------+
  | r5.large      | 2    | 16.0        | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | r5.xlarge     | 4    | 32.0        | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | r5.2xlarge    | 8    | 64.0        | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | r5.4xlarge    | 16   | 128.0       | MAX 10Gbps             |
  +---------------+------+-------------+------------------------+
  | r5.12xlarge   | 48   | 384.0       | 10Gbps                 |
  +---------------+------+-------------+------------------------+
  | r5.24xlarge   | 96   | 768.0       | 25Gbps                 |
  +---------------+------+-------------+------------------------+
  EOS

  GENERAL_FAMILY = <<~"EOS"
  +---------------+------+-------------+------------------------+
  | Instance type | vCPU | memory(GiB) | networking performance |
  +---------------+------+-------------+------------------------+
  | t2.nano       | 1    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t2.micro      | 1    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.small      | 1    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t2.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.nano       | 2    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t3.micro      | 2    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.small      | 2    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  EOS

  T_SERIES = <<~"EOS"
  +---------------+------+-------------+------------------------+
  | Instance type | vCPU | memory(GiB) | networking performance |
  +---------------+------+-------------+------------------------+
  | t2.nano       | 1    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t2.micro      | 1    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.small      | 1    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t2.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t2.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.nano       | 2    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t3.micro      | 2    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.small      | 2    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  EOS

  T3 = <<~"EOS"
  +---------------+------+-------------+------------------------+
  | Instance type | vCPU | memory(GiB) | networking performance |
  +---------------+------+-------------+------------------------+
  | t3.nano       | 2    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  | t3.micro      | 2    | 1.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.small      | 2    | 2.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.medium     | 2    | 4.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.large      | 2    | 8.0         | Low to Moderate        |
  +---------------+------+-------------+------------------------+
  | t3.xlarge     | 4    | 16.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  | t3.2xlarge    | 8    | 32.0        | Moderate               |
  +---------------+------+-------------+------------------------+
  EOS

  T3_NANO = <<~"EOS"
  +---------------+------+-------------+------------------------+
  | Instance type | vCPU | memory(GiB) | networking performance |
  +---------------+------+-------------+------------------------+
  | t3.nano       | 2    | 0.5         | Low                    |
  +---------------+------+-------------+------------------------+
  EOS

  #it "has a version number" do
  #  expect(EC2spec::VERSION).not_to be nil
  #end

  it "return all data" do
    output = capture(:stdout) { EC2spec::CLI.start(%w(list)) }
    expect(output).to eq ALL_DATA
  end

  it "specify --family general" do
    output = capture(:stdout) { EC2spec::CLI.start(%w(list --family=general)) }
    expect(output).to eq GENERAL_FAMILY
  end

  it "specify --family without option arugment" do
    expect{
      capture(:stderr) {
        EC2spec::CLI.start( %w(list --family) )
      }
    }.to raise_error( SystemExit )
  end

  it "specify --family not exist family" do
    output = capture(:stderr) { EC2spec::CLI.start(%w(list --family=aaa)) }
    expect(output).to eq("Expected '--family' to be one of general, compute, memory, accelerated, storage; got aaa\n")
  end

  it "specify --series t" do
    output = capture(:stdout) { EC2spec::CLI.start(%w(list --series=t)) }
    expect(output).to eq T_SERIES
  end

  it "specify --series without option arugment" do
    expect{
      capture(:stderr) {
        EC2spec::CLI.start( %w(list --series) )
      }
    }.to raise_error( SystemExit )
  end

  it "specify --series not exist series" do
    output = capture(:stderr) { EC2spec::CLI.start(%w(list --series=aaa)) }
    expect(output).to eq("Expected '--series' to be one of t, c, r; got aaa\n")
  end

  it "specify --series t --generation 3" do
    output = capture(:stdout) { EC2spec::CLI.start(%w(list --series=t --generation=3)) }
    expect(output).to eq T3
  end

  it "specify --series t and --generation not exist generation" do
    expect{
      capture(:stderr) {
        EC2spec::CLI.start( %w(list --series=t --generation=1) )
      }
    }.to raise_error( SystemExit )
  end

  it "specify --type t3.nano" do
    output = capture(:stdout) { EC2spec::CLI.start(%w(list --type=t3.nano)) }
    expect(output).to eq T3_NANO
  end

  it "specify --type without option arugment" do
    expect{
      capture(:stderr) {
        EC2spec::CLI.start( %w(list --type) )
      }
    }.to raise_error( SystemExit )
  end

  it "specify --type not exist instance type" do
    expect{
      capture(:stderr) {
        EC2spec::CLI.start( %w(list --type=t3.na) )
      }
    }.to raise_error( SystemExit )
  end
end
