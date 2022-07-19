def lab_exists?(str)
  str.downcase.include? "lab"
end

words = ["laboratory", "experiment", "Pans Labrynth", "elaborate", "polar bear"]

words.each do |word|
  p lab_exists?(word) ? "#{word} includes lab" : "#{word} doesn't include lab"
end