class Collection

  def initialize
    @collection = []
  end

  def each_element
  	i = 0
  	while i < @collection.length
      yield(@collection[i])
      i += 1
  	end
    
  end

  def add_element(element)
  	@collection << element
  end

  def remove_element(element)
  	@collection.delete(element)
  end

end

collection_variable = Collection.new
collection_variable.add_element("First Item")
collection_variable.add_element("Second Item")
collection_variable.add_element("Third Item")
collection_variable.each_element do |element|
  puts element
end