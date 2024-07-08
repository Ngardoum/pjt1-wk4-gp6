require 'bundler'

  Bundler.require

  $:.unshift File.expand\_path("./../lib", \_\_FILE\_\_)


  require './controller'

  run ApplicationController