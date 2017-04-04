require './secrets.rb'
class ApiManager
  def call
    puts "calling API... https://... #{Secrets.instance.API_KEY}:#{Secrets.instance.API_SECRET}"
  end
end

class BadManager
  def call
    new_api = Secrets.new
  end
end

api_manager = ApiManager.new
api_manager.call
bad_manager = BadManager.new
bad_manager.call
