# -*- encoding : utf-8 -*-
module Flooderfu
  module Network

    def is_ip?(ip)
      /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/ =~ ip
    end

    def is_mac?(mac)
      /^([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])$/ =~ mac
    end

    def is_port?(port)
      port.to_i > 1023
    end

    def random_ip
      [rand(0x100000000)].pack('N').unpack('C*').join('.')
    end

    def random_mac
      [0x00,rand(0xff),rand(0xff),rand(0xff),rand(0xff),rand(0xff)].map{ |n| n.to_s(16).rjust(2,"0") }.join(':')
    end

    def random_port
      rand(0xffff) + 1
    end

  end
end
