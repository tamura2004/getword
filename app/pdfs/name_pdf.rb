class NamePdf
  include Prawn::View

  WIDTH = 150
  HEIGHT = 150
  OFFSET = -30
  ABCSIZE = 84
  REGULAR = "vendor/fonts/migmix-1p-regular.ttf"
  BOLD = "vendor/fonts/migmix-1p-bold.ttf"
  LINE_PADDING = 16
  S = Prawn::Text::NBSP
  MS = S * 4
  LS = S * 16

  def initialize(names)
    super()
    # stroke_axis
    font REGULAR

    names.each do |name|
      practice_page(name)
      start_new_page
    end

  end

  def practice_page(name)
    float do
      text_box sprintf("用紙ID: %04d", name.id), at: [0, 740], size: 9
    end

    header

    lead "カードを交換してコンピュータ用語(以下ワード)を完成させましょう。席が離れた人と多く交換すると高得点になります。得点計算ルールを見て、自分なりの作戦を立てて参加してみましょう。"

    float do
      move_down LINE_PADDING/2
      seat_island_table [
          %w(船岡島 三浦島 大田島 奥平島),
          %w(! # $ %),
        ]
 
      move_down LINE_PADDING/2
      seat_island_table [
          ["その他島","","峯川島","山本島"],
          ["?","","&","@"]
        ]
    end

    chapter "1. 準備" do
      text "・あなたのマークを座席の島で決めます（右図）"
      text "・用紙下の8枚の英字カードの右上隅の四角内にも同じ"
      text "#{MS}マークを書き込んでください。"
      text "・点線でカードを切り離したら準備終了です。"
    end

    chapter "2. 交換" do
      text "・開始の合図があったら席を立って自由にカードを交換してください。双方の合意があれば、枚数が異なっていても、片方が0枚の交換でも構いません。誰とでも何回でも交換できます。"
    end

    chapter "3. ワード作成" do
      text "・終了の合図があったら着席し、カードを並べて意味のあるワードを作成しましょう。"
      font(BOLD){ text "・同じ文字のカードのペア2枚を好きな文字1枚として使うことができます。"}
      text "・作成したワードを下のマス目に記入しましょう。"
    end

    # ワード記入用マス目
    move_down LINE_PADDING/2
    12.times do |i|
      stroke do
        undash
        rectangle [20 + i * 40, cursor], 40, 40
      end
    end

    move_down 40

    chapter "4. 得点計算" do
      text "ワードに使わないカードがあっても構いません。その場合でもマークの種類には含めます。"
      move_down LINE_PADDING*2
      text "ワードの文字数 #{LS} × マークの種類数 #{LS} ＝ あなたの得点 #{LS}"
      stroke do
        undash
        rectangle [95,335],40,40
        rectangle [255,335],40,40
        rectangle [405,335],80,40
      end
    end

    # アルファベットカード配置
    name.words.each_with_index do |w, i|
      x = i % 4
      y = i / 4
      left = x * WIDTH + OFFSET
      top = (y + 1) * HEIGHT + OFFSET

      stroke do
        dash 4, space: 12, phase: 2
    
        if x.zero?
          horizontal_line OFFSET, WIDTH * 4 + OFFSET, at: top
        end

        if y == 1 && x != 0
          vertical_line OFFSET, HEIGHT * 2 + OFFSET, at: left
        end
      end

      stroke do
        undash
        rectangle [left + WIDTH - 50, top - 10], 30, 30
      end

      bounding_box [left, top], width: WIDTH, height: HEIGHT do
        text w.upcase, size: ABCSIZE, align: :center, valign: :center
      end
    end

  end

  def header
    table [[
        "<font size='16'>ワードリスト演習</font>",
        "名前:",
        "マーク:",
        "得点:"
      ]],
      column_widths: [200, 140, 100, 100],
      cell_style: {
        borders: [:bottom],
        inline_format: true,
        valign: :bottom
      }
  end

  def lead(str)
    pad_top(LINE_PADDING) do
      text(str)
    end
  end

  def headline(str)
    font(BOLD) do
      pad_top(LINE_PADDING) do
        text(str)
      end
    end
  end

  def chapter(title)
    headline(title)
    indent(20) do
      yield
    end
  end

  def seat_island_table(data)
    table data,
      position: :right,
      column_widths: [50, 50, 50, 50],
      cell_style: {
        size: 9,
        align: :center
      }
  end

end
