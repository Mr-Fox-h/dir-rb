require 'httparty'
require 'colorize'

class Scanner
  def initialize(target_site)
    @cust_target_site = target_site
  end

  def scan(status_code, file_name = '/usr/share/dnsmap/wordlist_TLAs.txt')
    item_found = []

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
          item_found << i
        end
      end
    else
      puts "[-] Error: Scan canceled\n" + 'HTTP status code: ' + "#{status_code}".colorize(:red)
    end

    puts "\n===============================================\n"
    unless item_found.length != 0
      puts '[-] Items found: ' + "0".colorize(:red)
    else
      print "[+] Items found: " + "#{item_found.length}".colorize(:green)
    end
  end

  def test
    puts "Your input address: #{@cust_target_site}"

    unless @cust_target_site[-1] == '/'
      @cust_target_site << '/'
    end
    test = HTTParty.get(@cust_target_site, format: :plain)

    case test.code
    in 200 then puts 'HTTP status code: ' + "#{test.code}".colorize(:green)
    else puts 'HTTP status code: ' + "#{test.code}".colorize(:red)
    end

    return test.code
  end
end
