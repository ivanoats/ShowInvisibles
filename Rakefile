# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'
require 'bubble-wrap'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Show Invisibles'
  app.icon = "icon_512x512@2x.png"
  app.copyright = "Copyright 2013 (C) Ivan Storck"
  app.identifier = 'com.ivanstorck.ShowInvisibles'
  app.info_plist['LSUIElement'] = true
end
