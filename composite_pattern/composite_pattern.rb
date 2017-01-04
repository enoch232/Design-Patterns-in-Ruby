class Person
  attr_accessor :name

  def initialize(name)
  	@name = name
  end
end

class Leader
  attr_accessor :name, :members
	def initialize(name)
		@name = name
		@members = []
	end

  def add_member(member)
  	@members << member
  end

  def remove_member(member)
  	@members.delete(member)
  end

  def number_of_people
  	@members.number_of_people.reduce(:+)
  end
end

class Pope < Leader
	def number_of_people
		@members.count
	end
end

class Cardinal < Leader
	def number_of_people
		@members.count
	end
end

class Archbishop < Leader
	def number_of_people
		@members.count
	end
end

class Bishop < Leader
	def number_of_people
    @members.count
	end
end

class Priest < Leader
	def number_of_people
		@members.count
	end
end

class Deacon < Person
end

firstDeacon = Deacon.new("FirstDeacon")
secondDeacon = Deacon.new("SecondDeacon")
firstPriest = Priest.new("FirstPriest")
firstPriest.add_member(firstDeacon)
firstPriest.add_member(secondDeacon)
puts "Priest #{firstPriest.name} has #{firstPriest.number_of_people} members"

firstBishop = Bishop.new("firstBishop")
firstBishop.add_member(firstPriest)
puts "Bishop #{firstBishop.name} has #{firstBishop.number_of_people} members"
