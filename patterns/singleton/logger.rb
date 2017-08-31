class Logger
  def initialize
    @log = File.open('log.txt', 'w')
  end

  @@instance = Logger.new

  def self.instance
    return @@instance
  end

  def log(msg)
    @log.puts(msg)
  end
end
