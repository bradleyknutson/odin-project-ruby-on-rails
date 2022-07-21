def substrings(base_word, substrings_list)
  substrings_list.reduce(Hash.new(0)) do |accumulator, word|
    accumulator[word.downcase] += base_word.downcase.scan(word.downcase).length if base_word.downcase.include? word.downcase
    accumulator
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
