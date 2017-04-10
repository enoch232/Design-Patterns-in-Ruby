class Wheel
  attr_accessor :size

  def initialize(option = {})
    @size = option[:size]
  end
end

class Engine
  attr_accessor :type

  def initialize(option = {})
    @type = option[:type]
  end
end

class Car
  attr_accessor :wheels, :engine

  def initialize(engine = nil, wheels = [])
    @wheels = wheels
    @engine = engine
  end

end

class CarBuilder

  def initialize
    @car = Car.new
  end

  def add_wheel(wheel)
    @car.wheels << wheel
  end

  def add_engine(engine)
    @car.engine = engine
  end

  def car
    raise "Car needs to have 4 wheels to be a car" if @car.wheels.count != 4
    raise "Car needs an engine to be a car" unless @car.engine
    raise "Car wheels need to be all the same" if @car.wheels.detect{ |wheel| wheel.size != @car.wheels.first.size }
    @car
  end
end

car_builder = CarBuilder.new
car_builder.add_wheel(Wheel.new(size: 18))
car_builder.add_wheel(Wheel.new(size: 18))
car_builder.add_wheel(Wheel.new(size: 18))
car_builder.add_engine(Engine.new(type: "V6"))
car_builder.add_wheel(Wheel.new(size: 17))
car = car_builder.car

puts car.inspect
