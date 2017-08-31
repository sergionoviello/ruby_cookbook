require_relative 'smartphone_builder'

sm = SmartphoneBuilder.new
sm.set_model('aaa')
sm.add_processor(1)

puts sm.smartphone.model
