require_relative 'make_cake_task'

cake = MakeCakeTask.new
task = cake[0][0]
puts "#{cake.time_required} minutes to make cake"


while task
  puts "task: #{task}"
  task = task.parent
end
