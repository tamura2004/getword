class SheetPdf
  include Prawn::View

  REGULAR = "vendor/fonts/migmix-1p-regular.ttf"
  BOLD = "vendor/fonts/migmix-1p-bold.ttf"

  def initialize
    @document = Prawn::Document.new(page_layout: :landscape)
    # stroke_axis
    font REGULAR

    define_grid(columns: 6, rows: 8, gutter: 0)
    # grid.show_all
    6.times do |j|
      8.times do |i|
        grid(i,j).bounding_box do
          pad(8) { indent(4) { text "ゴブリン#{i+j*8}" }}
          indent(12) do
            table [["1","2","3"]], cell_style: { width: 32, height: 32 }
          end
          stroke_bounds
        end
      end
    end

  end

end
