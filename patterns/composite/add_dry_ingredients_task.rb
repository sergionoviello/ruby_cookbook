require_relative 'task'

class AddDryIngredientsTask < Task
  def initialize
    super 'Add Dry Ingredients'
  end

  def time_required
    1
  end
end
