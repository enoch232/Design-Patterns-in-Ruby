require 'drb/drb'
class MathService
  def add(first, second)
    first+second
  end
end
math_service=MathService.new
DRb.start_service("druby://localhost:3030", math_service)
puts "Server is now running at port 3030"
DRb.thread.join