require "thor"
require "terminal-table"
require "yaml"
require "ec2spec/cli"
require "ec2spec/table"
require "ec2spec/data"
require "ec2spec/version"

module EC2spec
  DATA_FILE = "./spec_data.yml"
end
