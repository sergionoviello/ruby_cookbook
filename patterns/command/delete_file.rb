class DeleteFile < Command
  def initialize(target)
    super "Delete file: #{target}"
  end

  def execute
    puts 'execute'
  end

  def unexecute
    puts 'unexecute'
  end
end
