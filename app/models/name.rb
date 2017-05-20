# == Schema Information
#
# Table name: names
#
#  id         :integer          not null, primary key
#  w1         :string
#  w2         :string
#  w3         :string
#  w4         :string
#  w5         :string
#  w6         :string
#  w7         :string
#  w8         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Name < ApplicationRecord
  def words
    [w1, w2, w3, w4, w5, w6, w7, w8]
  end
end
