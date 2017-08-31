require_relative 'animal'

animal = Animal.new
animal.speak


animal.adapter = :cat
animal.speak
