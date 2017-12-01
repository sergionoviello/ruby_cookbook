class Node
  attr_accessor :val, :children, :eof

  def initialize(val)
    @val = val
    @children = []
    @eof = false
  end

  def insert(char)
    return get(char) if exists?(char)
    child = Node.new(char)
    @children << child
    child
  end

  def exists?(char)
    @children.each do |c|
      return true if c.val == char
    end
    false
  end

  def get(char)
    @children.each do |c|
      return c if c.val == char
    end
    false
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    curr = @root
    word.size.times do |i|
      child = curr.insert(word[i])
      curr = child
    end
    curr.eof = true
  end

  def search(word)
    curr = @root
    word.size.times do |i|
      return false unless curr.exists?(word[i])
      curr = curr.get(word[i])
    end
    return curr.eof == true
  end
end


t = Trie.new
t.insert('abcd')
t.insert('123')

p t.search('1')