require 'serverspec'
require 'net/ssh'
require 'pathname'
require 'yaml'

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS
include Serverspec::Helper::Properties

hosts = YAML.load_file('hosts.yml')

RSpec.configure do |c|
  c.host  = ENV['TARGET_HOST']
  set_property hosts[c.host]
  options = Net::SSH::Config.for(c.host)
  user    = options[:user] || Etc.getlogin

  if hosts[c.host][:vagrant?]
    vagrant_up = `vagrant up default`
    config = `vagrant ssh-config default`
    if config != ''
      config.each_line do |line|
        if match = /HostName (.*)/.match(line)
          c.host = match[1]
        elsif  match = /User (.*)/.match(line)
          user = match[1]
        elsif match = /IdentityFile (.*)/.match(line)
          options[:keys] =  [match[1].gsub(/"/,'')]
        elsif match = /Port (.*)/.match(line)
          options[:port] = match[1]
        end
      end
    end
  end

  c.ssh   = Net::SSH.start(c.host, user, options)
  c.os    = backend.check_os
end
