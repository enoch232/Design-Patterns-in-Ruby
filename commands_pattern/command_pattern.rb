class Command
  def initialize(description)
  	@description = description
  end

  def execute
  end
end

class AddPostCommand < Command
  def initialize(title, author, body)
    super("Create post with the title of #{title}, author of #{author}, body of #{body}")
  end

  def execute
  end

  def unexecute
  end
end

class Post
  attr_accessor :id, :title, :author, :body
  def initialize(id, title, author, body)
  	@id = id
  	@title = title
  	@author = author
  	@body = body
  end
end

class PostList
  def initialize
  	@posts = []
  end

  def add_post(title, author, body)
  	@posts << Post.new(@posts.size, title, author, body)
  end

  def remove_post(id)
  	@posts.delete_if{ |post| post.id == id }
  end

  def method_missing(method_name, *args)
  	method_name = method_name.to_s
  	unless method_name =~ /remove_post_by_/
      return
  	end
    letters = method_name.split('_')
    delete_by = letters[3]
    send()
  end

  def display_posts
  	@posts.each do |post|
  	  puts post.id
  	end
  end
end

@posts = PostList.new
@posts.add_post("First Post", "Enoch Ko", "This is the body of first post")
@posts.add_post("Second Post", "Jaemin Ko", "This is the body of second post")
@posts.remove_post_by_id(1)
@posts.display_posts
