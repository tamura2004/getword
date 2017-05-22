# WORDS = Array.new.methods.join.gsub(/[^a-z]/,"").split(//)
# WORDS = Array.new.methods.join.gsub(/[^a-z]/,"").split(//)

100.times do |id|
  words = ('A'..'Z').to_a.sample(8)
  Name.seed do |s|
    s.id = id
    s.w1 = words[1-1] 
    s.w2 = words[2-1] 
    s.w3 = words[3-1] 
    s.w4 = words[4-1] 
    s.w5 = words[5-1] 
    s.w6 = words[6-1] 
    s.w7 = words[7-1] 
    s.w8 = words[8-1] 
  end
end
