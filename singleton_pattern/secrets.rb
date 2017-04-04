class Secrets

  @@instance = Secrets.new
  def self.instance
    @@instance
  end

  def API_KEY
    "ABCDEFG"
  end

  def API_SECRET
    "123456"
  end

  private_class_method :new

end
