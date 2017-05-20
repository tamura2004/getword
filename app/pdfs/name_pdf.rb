class NamePdf
  include Prawn::View

  WIDTH = 150
  HEIGHT = 150
  OFFSET = -30
  ABCSIZE = 84
  REGULAR = "vendor/fonts/migmix-1p-regular.ttf"
  BOLD = "vendor/fonts/migmix-1p-bold.ttf"
  LINE_PADDING = 16

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
    header

    lead "カードを交換してワードを完成させましょう。より多くの人と交換し、長いワードを作成すると高得点です。積極性を発揮して、高得点を得るための作戦を考えて参加してみましょう。"

    float do
      move_down LINE_PADDING
      seat_island_table [
          %w(船岡 三浦 大田 奥平),
          %w(! # $ %),
        ]
 
      move_down LINE_PADDING
      seat_island_table [
          %w(長田 峠 峯川 山本),
          %w(? * & @)
        ]
    end

    chapter "1. 準備" do
      text "・あなたのマークを座席の島で決めます（右図）"
      text "・用紙下の英字カードの右上隅の四角内にも同じ"
      text "#{Prawn::Text::NBSP*4}マークを書き込んでください。"
      text "・点線でカードを切り離したら準備終了です。"
    end

    move_down 20

    chapter "2. 交換" do
      text "・開始の合図があったら席を立って自由にカードを高官してください。双方の合意があれば、枚数が異なっていても、片方が0枚の交換でも構いません。誰とでも何回でも交換できます。制限時間は10分です。"
    end

    chapter "3. ワード作成" do
      text "・終了の合図があったら着席し、カードを並べて意味のあるワード（文字列）を作成しましょう。「vi」や「ls」など辞書に乗っている英単語でなくても、コンピュータ用語であれば適正なワードです。"
      text "同じ文字のカードのペア（例「Q」「Q」の2枚）を好きな別のアルファベットとして使うことができます。うまくワードにならない場合、活用しましょう。"
      text "複数のワードを作成できますが、1枚のカードは1つのワードにしか使えません。使わなかったカードは減点対象になります。"
    end

    chapter "4. 得点計算" do
      text "・以下の通り計算します。ワードがすべてコンピュータ用語であれば計算結果をさらに2倍にします。"
      text "（最も長いワードのカード枚数 ー 使えなかったカードの枚数）× マークの種類数"
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
