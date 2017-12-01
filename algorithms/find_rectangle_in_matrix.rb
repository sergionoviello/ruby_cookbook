# given a matrix find if there is a rectangle in the matrix 
# with all corners = 1
require 'matrix'

r = 4
c = 5

# row1 = [1, 0, 0, 1, 0]
# row2 = [0, 0, 1, 0, 1]
# row3 = [0, 0, 0, 1, 0]
# row4 = [1, 0, 1, 0, 1]


row1 = [1, 1, 0, 1, 1]
row2 = [1, 1, 0, 1, 1]
row3 = [0, 0, 0, 0, 0]
row4 = [0, 0, 0, 0, 0]



matrix = Matrix.rows([row1, row2, row3, row4])

def map_ones(matrix, r, c)
  map = []

  for i in 0..r - 1
    row_ones = []

    for j in 0..c - 1
      row_ones << j if matrix.row(i)[j] == 1
    end

    map[i] = row_ones
  end
  map
end

def find_rectangle(map, matrix, r, c)
  rectangles = []
  for k in 0..map.size - 1
    for j in 0..map.size - 1      
      rectangles << [k, j] if k != j && (map[k] & map[j]).size >= 2 && !rectangles.include?([k, j].sort!)
    end
  end
  rectangles
end


map = map_ones(matrix, r, c)
p find_rectangle(map, matrix, r, c)
