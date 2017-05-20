class CreateNames < ActiveRecord::Migration[5.1]
  def change
    create_table :names do |t|
      t.string :w1
      t.string :w2
      t.string :w3
      t.string :w4
      t.string :w5
      t.string :w6
      t.string :w7
      t.string :w8

      t.timestamps
    end
  end
end
