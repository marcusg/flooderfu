# Flooderfu

Flooderfu is a simple toolset for flooding devices with different kinds of packages (atm: icmp, syn). It is based on the very nice gem *packetfu* created by Tod Beardsley (https://github.com/todb/packetfu). Use this only to (penetration-) test your own devices!

## Installation

Install packet capture lib

    sudo apt-get install libpcap-dev

Add this line to your application's Gemfile if you want to use it programmatically:

    gem 'flooderfu'

And then execute:

    $ bundle

Or install it yourself if you just want to use the commandline tools:

    $ gem install flooderfu

## Usage

## Commandline

NOTE: You need to be root user!

For using the syn-flooder use:

    $ flooderfu-syn --help

And for the icmp-flooder:

    $ flooderfu-icmp --help

Try the rvmsudo command if you're using rvm. For example:

    $ rvmsudo flooderfu-icmp -i eth0

## In your Ruby files use it like:

    @opt = Flooderfu::Syn::Options.new :destination_ip => "xxx.xxx.xxx.xxx", :destination_mac => "xx:xx:xx:xx:xx:xx", :interface => "eth0"
    @syn = Flooderfu::Syn::Attack.new(@opt).start!

To show all options use the commandline tools with parameter `--help`

## TODO
1. Write tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
