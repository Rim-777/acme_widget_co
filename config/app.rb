# frozen_string_literal: true

require 'ostruct'
require 'pathname'
require 'bigdecimal'
require 'bigdecimal/util'

Config = OpenStruct.new
Config.root = Pathname.new(File.expand_path(__dir__))

[%w[../lib/acme_vidget_co ** *.rb]].each do |folder|
  Dir.glob(Config.root.join(*folder)).each { |file| require file }
end