class SheetPdf
  include Prawn::View

  REGULAR = "vendor/fonts/migmix-1p-regular.ttf"
  BOLD = "vendor/fonts/migmix-1p-bold.ttf"

  def initialize
    @document = Prawn::Document.new(page_layout: :landscape)
    # stroke_axis
    font REGULAR

    define_grid(columns: 10, rows: 10, gutter: 4)
    # grid.show_all
    6.times do |j|
      8.times do |i|
        grid(i,j).bounding_box do
          pad(8) { indent(8) { text "#{rand(100)}" }}
          stroke_bounds
        end
      end
    end

  end

end
