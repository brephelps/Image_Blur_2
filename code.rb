class Image
  attr_accessor :blurred_rows, :targets, :rows

  def initialize(image)
    @rows = image
    @targets = []
  end

  def output_image
    # loop through rows
    @rows.each_with_index do |cells, row_index|
      # loop through cells
      cells.each_with_index do |cell, cell_index|
        # find cells that are 1
        if cell == 1
          # create hash with row/cell as key and index as value
          @targets << {target_row: row_index, target_cell: cell_index}
        end
      end
    end
    
    final_array = []

    blurred_rows =
      @rows.each_with_index.map do |cells, row_index|
        final_array << []
        cells.each_with_index.map do |cell, cell_index|
          #default each cell as 0
          num = 0
          #run through each of the targets and compare their locations to current location
          @targets.each do |target|
            row_index_difference = target[:target_row] - row_index
            cell_index_difference = target[:target_cell] - cell_index

            # change cells on left and right of 1 
            if (row_index_difference == 0) && (cell_index_difference == 1 || cell_index_difference == -1)
              num = 1
            # change cells above and below 1
            elsif (cell_index_difference == 0) && (row_index_difference == 1 || row_index_difference == -1)
              num = 1
            # keep original 1 as 1
            elsif (row_index_difference == 0) && (cell_index_difference == 0)
              num = 1
            end
          end
          final_array[row_index][cell_index] = num
        end
      end
    
    final_array.each do |element|
      puts element.join("")
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.output_image


