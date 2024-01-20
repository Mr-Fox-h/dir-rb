require 'httparty'
require 'colorize'

class Scanner
  def initialize(target_site)
    @cust_target_site = target_site
  end

  def scan(file_name = 'dic.txt', status_code)
    if status_code == 200
      pages = File.readlines(file_name)
      for i in pages do
        i = i.split("\n")
        i = i[0]
        address = HTTParty.get("#{@cust_target_site + i}", format: :plain)
        if address.code != 200
          print '[*] Testing: ' + "#{@cust_target_site + i}\r".colorize(:blue)
        else
          puts '[+] Found: ' + "#{@cust_target_site + i}".colorize(:green)
        end
      end
    else
      puts 'Error: The scanner can\'t work now'
      puts 'HTTP status code:' + "#{status_code}".colorize(:color => :light_yellow, :background => :white)
    end
  end

  def test
    puts "Your input address: #{@cust_target_site}"
    test = HTTParty.get(@cust_target_site, format: :plain)
    case test.code
    in 200 then puts 'HTTP status code: ' + "#{test.code}".colorize(:green)
    else puts 'HTTP status code: ' + "#{test.code}".colorize(:red)
    end
    return test.code
  end
end
