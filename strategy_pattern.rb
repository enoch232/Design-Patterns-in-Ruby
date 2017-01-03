class Document
  attr_accessor :title, :author, :body
  def initialize(title, body)
    @title = title
    @body = body
  end

  def render_output
    puts "Title: #{title}"
    puts "Body: #{body}"
  end
end

class Formatter

end

class Letter < Document
  attr_accessor :to, :from
  def initialize(title, body, to, from)
    super(title, body)
    @to = to
    @from = from
  end
  def render_output
  	puts "To: #{to}"
  	puts "From: #{from}"
    puts "Title: #{title}"
    puts "Body: #{body}"
  end
end

class Book < Document
  attr_accessor :to, :from
  def initialize(title, author, body)
    super(title, body)
    @author = author
  end
  def render_output
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "Body: #{body}"
  end
end

new_document = Book.new("First Document", "Enoch Ko", "This is a document")
new_document.render_output
new_letter = Letter.new("First Letter", "This is a letter", "Enoch", "Jaemin")
new_letter.render_output
new_book = Book.new("First Book", "Enoch Ko", "This is a book")
new_book.render_output



