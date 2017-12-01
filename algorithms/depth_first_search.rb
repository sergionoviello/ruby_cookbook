
def depth_first_search(adj_matrix, start_index, end_index)
  stack = [start_index]

  loop do
    curr_node = stack.pop
    return false if curr_node.nil?
    return true if curr_node == end_index

    children = (0..adj_matrix.length - 1).to_a.select do |x|
      adj_matrix[curr_node][x] == 1
    end

    stack = stack + children
  end
end

adj_matrix = [
  [0, 0, 1, 0, 1, 0],
  [0, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 1, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
]

p depth_first_search(adj_matrix, 0, 5)
