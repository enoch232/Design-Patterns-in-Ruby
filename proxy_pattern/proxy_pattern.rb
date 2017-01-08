class ItemManager
  def initialize
    @items = []
  end

  def add_item(item)
  	@items << item
  end

  def remove_item(item)
  	@items.delete(item)
  end

  def display_items
  	@items.each do |item|
  	  puts item
  	end
  end
end

class ItemManagerProxy
  def initialize
  end

  def add_item(item)
  	s = subject
  	s.add_item(item)
  end

  def remove_item(item)
  	s = subject
  	s.remove_item(item)
  end

  def display_items
  	s = subject
  	s.display_items
  end

  def subject
  	@subject || (@subject = ItemManager.new)
  end
end

item_manager = ItemManagerProxy.new
item_manager.add_item("First")
item_manager.add_item("Second")
item_manager.add_item("Third")
item_manager.display_items
item_manager.remove_item("Second")
item_manager.display_items
