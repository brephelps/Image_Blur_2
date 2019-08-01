
class Image
  attr_accessor :items

  def initialize(items)
    @items = []
    @items << items
  end

  def output_image
    @items.each do |r| 
      r.each do |element|
        puts element.join("")
      end
    end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image


