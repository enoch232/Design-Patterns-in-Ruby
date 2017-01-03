class SelectedParagraph
  #many methods, attributes are omitted.
  def update(current_notifier)
    puts "SelectedParagraph: #{current_notifier.class} has been changed."
  end
end

class SelectedSentence
  #many methods, attributes are omitted.
  def update(current_notifier)
    puts "SelectedSentence: #{current_notifier.class} has been changed."
  end
end

class CurrentStyle
  def initialize(font, color, size)
  	@observers = []
  	@font = font
  	@color = color
  	@size = size
  end

  def font=(new_font)
  	@font = new_font
  	notify_observables
  end

  def color=(new_color)
  	@color = new_color
  	notify_observables
  end

  def size=(new_size)
  	@size = new_size
  	notify_observables
  end
  
  def add_observable(observe)
  	@observers << observe
  end

  def delete_observable(observe)
    @observers.delete(observe)
  end

  def notify_observables
  	@observers.each do |observer|
  	  observer.update(self)
	end
  end
end

current_style = CurrentStyle.new("Times New Roman", "Red", 12)
current_style.add_observable(SelectedParagraph.new)
current_style.add_observable(SelectedSentence.new)
current_style.font = "Comic Sans"