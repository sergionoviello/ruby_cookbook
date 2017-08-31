class CopyFile < Command
  def initialize(source, target)
    super "Copy file: #{source} to #{target}"
  end

  def execute
    puts 'execute'
  end

  def unexecute
    puts 'unexecute'
  end
end
