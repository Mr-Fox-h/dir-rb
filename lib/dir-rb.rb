require_relative 'scanner.rb'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ?"

  # NOTE: Address
  opts.on("-a", "--address NAME", "Site") do |site_address|
    puts "==================== Wordlist ====================\n"
    print "Wordlist (Empty = default): "
    wordlist = gets.chomp
    p wordlist
    unless wordlist != ""
      wordlist = '/usr/share/set/src/fasttrack/wordlist.txt'
    else
      wordlist
    end

    puts "\n========== Target URL: #{site_address} ==========\n"
    puts Time.now.asctime
    target = Scanner.new("#{site_address}")
    code = target.test
    puts "\n========= Scanning URL: #{site_address} =========\n"
    target.scan(code, wordlist)
  end

  # NOTE: Help option
  opts.on('-h', '--help', 'Print this help') do
    puts opts
    exit
  end
end.parse!

options
