string = "Hello world"
string_arr = string.downcase.gsub(" ", '').split('')

def get_char_map(string_arr)
  string_arr.reduce(Hash.new(0)) do |map, char|
    map[char] += 1
    map
  end
end

p get_char_map(string_arr)