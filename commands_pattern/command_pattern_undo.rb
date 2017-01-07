#This program will demonstrate a bunch of commands where it creates posts, 
class Post
  attr_accessor :title, :author, :body

  def initialize(title, author, body)
  	@title = title
  	@author = author
  	@body = body
  end

end

class PostManager
  def initialize
    @posts = []
  end

  def add_post(post)
  	@posts << post
  end

  def remove_post_by_title(title)
  	@posts.delete_if { |post| post.title == title}
  end

  def each(&block)
  	index = 0
  	while index < @posts.size
  	  block.call(@posts[index])
  	  index += 1
  	end
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
  attr_accessor :post
  def initialize(title, author, body, post_store)
  	super("add a new post with the title: #{title}, author: #{author}, body: #{body}")
  	@post = Post.new(title, author, body)
  	@post_store = post_store
  end

  def execute
  	puts "adding a new post."
  	@post_store.add_post(@post)
  end

  def unexecute
  	puts "removing a new post."
  	@post_store.remove_post_by_title(@post.title)
  end

end

com = CompositeCommand.new
store = PostManager.new
com.add_command(AddPostCommand.new("First Post", "Enoch Ko", "This is a first post", store))
com.add_command(AddPostCommand.new("Second Post", "Jaemin Ko", "This is a second post", store))
com.execute
# com.unexecute
store.each do |post|
  puts post.title
end




