class Image

  def initialize (picture)
    @picture = picture
  end

  def find_the_ones
    ones = []
    @picture.each_with_index do |row_content, row_number|
      row_content.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur
    ones = find_the_ones
    @picture.each_with_index do |row_content, row_number|
      row_content.each_with_index do |item, col_number|
        ones.each do |one_row_number, one_col_number|
          if row_number == one_row_number && col_number == one_col_number
            @picture[row_number - 1][col_number] = 1 unless row_number == 0
            @picture[row_number + 1][col_number] = 1 unless row_number >= 3
            @picture[row_number][col_number - 1] = 1 unless col_number == 0
            @picture[row_number][col_number + 1] = 1 unless col_number >= 3
          end
        end
      end
    end
  end

  def output_image
    @picture.each do |ary|
      puts ary.join
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
puts
image.blur

image.output_image