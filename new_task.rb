#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"
conn = Bunny.new
conn.start
channel = conn.create_channel
msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")
queue = channel.queue('hello')
queue.publish(msg, persistent: true)
puts " [x] Sent #{msg}"
conn.close
