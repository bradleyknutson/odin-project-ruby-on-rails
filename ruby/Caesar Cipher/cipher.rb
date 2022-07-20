def cipher(string, shift_factor) 
  string_arr = string.split('')
  cipher_arr = string_arr.map do |char|
    special = "!?<>',?[]}{=-)(*&^%$#`~{} "
    if special.include? char
      char
    else
      char_num = char.ord + shift_factor
      char_num.between?((char.upcase == char ? "A" : "a").ord, (char.upcase == char ? "Z" : "z").ord) ? char_num.chr : (char_num - 26).chr
    end
  end
  cipher_arr.join('')
end

p cipher("What a string!", 5)