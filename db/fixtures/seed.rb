WORDS = Array.new.methods.join.gsub(/[^a-z]/,"").split(//)

100.times do |id|
  Name.seed do |s|
    s.id = id
    s.w1 = WORDS.sample
    s.w2 = WORDS.sample
    s.w3 = WORDS.sample
    s.w4 = WORDS.sample
    s.w5 = WORDS.sample
    s.w6 = WORDS.sample
    s.w7 = WORDS.sample
    s.w8 = WORDS.sample
  end
end
