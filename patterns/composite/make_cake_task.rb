require_relative 'composite_task'
require_relative 'bake_task'
require_relative 'add_dry_ingredients_task'
require_relative 'make_batter_task'

class MakeCakeTask < CompositeTask
  def initialize
    super('make cake')
    add_sub_task(MakeBatterTask.new)
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(BakeTask.new)
  end
end
