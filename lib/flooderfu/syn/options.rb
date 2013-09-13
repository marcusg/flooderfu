# -*- encoding : utf-8 -*-
require 'flooderfu'
require 'optparse'

module Flooderfu
  module Syn

    class Options
      include Flooderfu::Network

      attr_accessor :destination_ip, :destination_mac, :destination_port, :size, :runs, :interface, :verbose

      INTERFACE = "eth0"
      SIZE = 10
      RUNS = 100

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

          @destination_port = random_port
          opts.on('-p', '--destination-port PORT', "Port number of destination device (default: random)") do |f|
            @destination_port = f
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
            puts "Flooderfu #{Flooderfu::VERSION}"
            exit
          end
        end

        optparse.parse!
      end

    end

  end
end





