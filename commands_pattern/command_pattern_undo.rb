#This program will demonstrate a bunch of commands where it creates posts, 
class Post
  attr_accessor :title, :author, :body

  def initialize(title, author, body)
  	@title = title
  	@author = author
  	@body = body
  end

end

class Command
  attr_accessor :description

  def initialize(description)
    @description = description
  end
  
  def execute
  end

  def unexecute
  end

end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute
  	@commands.each do |command|
  	  command.execute
  	  puts command.description
  	end
  end

  def unexecute
  	@commands.reverse.each do |command|
      command.unexecute
  	end
  end

end

class AddPostCommand < Command
  def initialize(title, author, body)
  	super("add a new post with the title: #{title}, author: #{author}, body: #{body}")
  end

  def execute
  	puts "adding a new post."
  end

  def unexecute
  	puts "removing a new post."
  end

end

com = CompositeCommand.new
com.add_command(AddPostCommand.new("First Post", "Enoch Ko", "This is a first post"))
com.add_command(AddPostCommand.new("Second Post", "Jaemin Ko", "This is a second post"))
com.execute
com.unexecute
