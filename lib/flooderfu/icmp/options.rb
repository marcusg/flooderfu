# -*- encoding: utf-8 -*-

require 'flooderfu'
require 'optparse'
require 'pp'

options = {}

optparse = OptionParser.new do |opts|

  opts.separator ""
  opts.separator "Options:"

  opts.on( '-x', '--mode TYPE', [:syn, :icmp], "Select a type of attack (syn or icmp)" ) do |f|
    options[:mode] = f
  end

  opts.on( '-d', '--destination-ip IP', "IP of destination device" ) do |f|
    options[:destination_ip] = f
  end

  opts.on( '-m', '--destination-mac MAC', "MAC of destination device" ) do |f|
    options[:destination_mac] = f
  end

  opts.on( '-p', '--destination-port PORT', Integer, "Port number of destination device" ) do |f|
    options[:destination_port] = f
  end

  opts.on( '-a', '--source-ip IP', "IP of source device" ) do |f|
    options[:source_ip] = f
  end

  opts.on( '-n', '--source-mac MAC', "MAC of source device" ) do |f|
    options[:source_mac] = f
  end

  opts.separator ""


  opts.on( '-s', '--size INTEGER', Integer, "Size of the array to inject (default: 10)" ) do |f|
    options[:size] = f || 10
  end

  opts.on( '-r', '--runs INTEGER', Integer, "How many iterations (default: 100)" ) do |f|
    options[:runs] = f || 100
  end

  opts.on( '-l', '--load INTEGER', "Size of the payload (default: 8)" ) do |f|
    options[:load] = f || 8
  end

  opts.on( '-i', '--interface INTERFACE', "Name of the interface (default: eth0)" ) do |f|
    options[:interface] = f || "eth0"
  end

  opts.on( '-t', '--ttl INTEGER', "Time to live (ttl) (default: 64)" ) do |f|
    options[:ttl] = f || 64
  end

  opts.separator ""

  # debug / help options
  opts.on("-f", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end

  opts.on_tail('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end

  opts.on_tail('-v', "--version", "Show version") do
    puts Flooderfu::VERSION
    exit
  end
end


optparse.parse!

pp "Options:", options
pp "ARGV:", ARGV
Flooderfu::Syn.new