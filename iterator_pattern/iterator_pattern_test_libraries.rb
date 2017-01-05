require 'pathname'
pn = Pathname.new('/usr/local/lib/ruby/1.8')
pn.each_filename { |file| puts file }
# pn.each_entry { |entry| puts ":#{entry}}" }