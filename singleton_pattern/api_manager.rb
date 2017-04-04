require './secrets.rb'
class ApiManager
  def call
    puts "calling API... https://... #{Secrets.instance.API_KEY}:#{Secrets.instance.API_SECRET}"
  end
end

api_manager = ApiManager.new
api_manager.call
