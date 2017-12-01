class Cipher
  attr_accessor :str, :lowercase_alphabet, :uppercase_alphabet

  ALPHABET = "abcdefghijklmnopqrstuvwxyz".freeze

  def initialize(str)
    @str = str.split('')
    @lowercase_alphabet = ALPHABET.split('')
    @uppercase_alphabet = ALPHABET.upcase.split('')
  end

  def encrypt
    res = ''

    @str.each do |s|
      res << ' ' and next if s == ' '
      alphabet = @uppercase_alphabet.include?(s) ? @uppercase_alphabet : @lowercase_alphabet
      res << alphabet[(alphabet.index(s) + 13) % 26]
    end

    res
  end
end
