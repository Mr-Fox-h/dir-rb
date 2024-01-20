require_relative 'scanner.rb'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ?"

  # NOTE: address
  opts.on("-a", "--address NAME", "Site") do |site_address|
    puts "\n===============================================\n"
    puts Time.now.asctime
    target = Scanner.new("#{site_address}")
    code = target.test
    puts "==============================================="
    target.scan(code)
  end

  # NOTE: Help option
  opts.on('-h', '--help', 'Print this help') do
    puts opts
    exit
  end
end.parse!

options
