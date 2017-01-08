
class UnitedStatesUnitAdapter
  attr_accessor :length_in_ft, :weight_in_lb

  def initialize(hash)
  	@length_in_ft = hash[:length_in_ft]
  	@weight_in_lb = hash[:weight_in_lb]
  end

  def length_in_m
    @length_in_ft * 0.3048
  end

  def weight_in_kg
  	@weight_in_lb * 0.453592
  end
end

class UnitAdapter
  attr_accessor :length_in_m, :weight_in_kg

  def initialize(hash)
  	@length_in_m = hash[:length_in_m]
  	@weight_in_kg = hash[:weight_in_kg]
  end
end

class Renderer
  attr_accessor :length_in_m, :weight_in_kg

  def initialize(render_obj)
  	@length_in_m = render_obj.length_in_m
  	@weight_in_kg = render_obj.weight_in_kg
  end
end

#length in meters, weight in kg.
render = Renderer.new(UnitAdapter.new({length_in_m: 10, weight_in_kg: 15}))
puts render.length_in_m
puts render.weight_in_kg
render = Renderer.new(UnitedStatesUnitAdapter.new({length_in_ft: 10, weight_in_lb: 15}))
puts render.length_in_m
puts render.weight_in_kg