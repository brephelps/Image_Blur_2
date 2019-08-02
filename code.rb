class Image
  attr_accessor :blurred_rows, :target, :rows

  def initialize(image)
    @rows = image
    @target = nil
  end

  def output_image
    # loop through rows
    @rows.each_with_index do |cells, row_index|
      # loop through cells
      cells.each_with_index do |cell, cell_index|
        # find cells that are 1
        if cell == 1
          # create hash with row as key and cell as value
          @target = {row_index: row_index, cell_index: cell_index}
        end
      end
    end

    blurred_rows =
      @rows.each_with_index.map do |cells, row_index|
        cells.each_with_index.map do |cell, cell_index|
          row_index_difference = target[:row_index] - row_index
          cell_index_difference = target[:cell_index] - cell_index

          # change cells on left and right of 1 
          if (row_index_difference == 0) && (cell_index_difference == 1 || cell_index_difference == -1)
            1
          # change cells above and below 1
          elsif (cell_index_difference == 0) && (row_index_difference == 1 || row_index_difference == -1)
            1
          # keep original 1 as 1
          elsif (row_index_difference == 0) && (cell_index_difference == 0)
            1
          # keep original 0 as 0
          else
            0
          end
        end
      end
    
    blurred_rows.each do |element|
      puts element.join("")
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.output_image
