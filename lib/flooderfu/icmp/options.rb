# -*- encoding: utf-8 -*-

require 'flooderfu'
require 'optparse'
require 'pp'

module Flooderfu
  module Icmp

    class Options
      include Flooderfu::Network

      attr_accessor :destination_ip, :destination_mac, :source_ip, :source_mac,
                    :size, :load, :ttl, :runs, :interface, :verbose

      INTERFACE = "eth0"
      SIZE = 10
      RUNS = 100
      LOAD = 8
      TTL = 64

      def initialize(*args)

        optparse = OptionParser.new do |opts|
          opts.separator ""
          opts.separator "Options:"

          @destination_ip = random_ip
          opts.on('-d', '--destination-ip IP', "IP of destination device (default: random)") do |f|
            @destination_ip = f
          end

          @destination_mac = random_mac
          opts.on('-m', '--destination-mac MAC', "MAC of destination device (default: random)") do |f|
            @destination_mac = f
          end

          @source_ip = random_ip
          opts.on( '-a', '--source-ip IP', "IP of source device" ) do |f|
            @source_mac = f
          end

          @source_mac = random_mac
          opts.on( '-n', '--source-mac MAC', "MAC of source device" ) do |f|
            @source_mac = f
          end

          opts.separator ""


          @load = LOAD
          opts.on('-l', '--load INTEGER', "Size of the payload (default: #{LOAD})") do |f|
            @load = f
          end

          @ttl = TTL
          opts.on('-t', '--ttl INTEGER', "Time to live (ttl) (default: #{TTL})") do |f|
            @ttl = f
          end

          @size = SIZE
          opts.on('-s', '--size INTEGER', Integer, "Size of the array to inject (default: #{SIZE})") do |f|
            @size = f
          end

          @runs = RUNS
          opts.on('-r', '--runs INTEGER', Integer, "How many iterations (default: #{RUNS})") do |f|
            @runs = f
          end

          @interface = INTERFACE
          opts.on('-i', '--interface INTERFACE', "Name of the interface (default: #{INTERFACE})") do |f|
            @interface = f
          end

          opts.separator ""

          # debug / help options
          @verbose = false
          opts.on("-f", "--[no-]verbose", "Run verbosely") do |v|
            @verbose = true
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
      end

    end

  end
end

