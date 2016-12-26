@monitor = Monitor.new
@object = "original"
th1 = Thread.new do 
  puts "processing 1"
  sleep 3
  puts "processed 1"
  @object = "changed by thread1"
end
th2 = Thread.new do 
  puts "processing 2"
  sleep 3
  puts "processed 2"
  @object = "changed by thread2"
end
th1.join
th2.join
# puts "both are processed."

# @monitor.synchronize do
#   th1.join
#   th2.join
# end
puts @object