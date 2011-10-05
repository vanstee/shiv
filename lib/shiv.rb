require 'chef/node'
require 'chef/knife'
require 'chef/config'

module Shiv
  def self.edit(command)
    configure
    nodes.each do |node|
      command.gsub!(node, hostname_from(node)) if command.include? node
    end
    command
  end
  
  def self.nodes
    Chef::Node.list.keys.sort.reverse
  end
  
  def self.hostname_from(node)
    node = Chef::Node.load(node)
    node['cloud']['public_hostname']
  end
  
  def self.configure
    Chef::Knife.new.configure_chef
  end
end

class Chef
  class Config
    config_attr_writer :log_level do |l|
      configure do |c|
        c[:log_level] = :error
      end
    end
  end
end
