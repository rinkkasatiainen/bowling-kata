#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__) 
require 'bowling'
game = Bowling::GameUi.new(STDOUT)
game.start