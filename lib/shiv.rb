require 'chef/node'
require 'chef/knife'

module Shiv
  def self.edit(command)
    configure
    nodes.each do |node|
      command.gsub!(node, hostname_from(node)) if command.include? node
    end
    command
  end
  
  def self.nodes
    Chef::Node.list.keys
  end
  
  def self.hostname_from(node)
    Chef::Node.load(node)["ec2"]["public_hostname"]
  end
  
  def self.configure
    Chef::Knife.new.configure_chef
  end
end