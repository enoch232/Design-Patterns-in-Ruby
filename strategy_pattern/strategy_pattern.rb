class Reader
  attr_accessor :formatter
  def initialize(formatter, title = nil, body = nil, to = nil, from = nil, author = nil)
    @formatter = formatter
    @title = title
    @body = body
    @to = to
    @from = from
    @author = author
  end

  def render_output
    @formatter.render_output(@title, @body, @to, @from, @author)
  end
end

class Formatter
  def render_output
    puts "warning: Abstract method called."
  end
end

class Document < Formatter
  def render_output(title, body, to, from, author)
    puts "Title: #{title}"
    puts "Body: #{body}"
  end
end

class Letter < Formatter
  def render_output(title, body, to, from, author)
  	puts "To: #{to}"
  	puts "From: #{from}"
    puts "Title: #{title}"
    puts "Body: #{body}"
  end
end

class Book < Formatter
  def render_output(title, body, to, from, author)
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "Body: #{body}"
  end
end

new_reader = Reader.new(Document.new, "First Document", "This is body of the document")
new_reader.render_output
new_reader = Reader.new(Letter.new, "First Letter", "This is body of the letter", "Jaemin Ko", "Enoch Ko")
new_reader.render_output
new_reader = Reader.new(Book.new, "First Book", "This is body of the book",nil,nil,"Enoch Ko")
new_reader.render_output


