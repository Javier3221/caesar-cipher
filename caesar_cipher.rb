def cipher(string, shift_factor)
  lowercase = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  uppercase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  whitespaces = false

  if string.match?(/(\s)/) 
    words_array = string.split(" ")
    letters_array = words_array.map {|item| item.split("")}
    whitespaces = true
  else
    words_array = string.split("")
  end

  if !whitespaces
    ciphered = words_array.map do |item|
      if lowercase.include?(item)
        item = lowercase[lowercase.index(item) + shift_factor]
      elsif uppercase.include?(item)
        item = uppercase[uppercase.index(item) + shift_factor]
      else
        item
      end
    end

    return ciphered.join
  else
    ciphered = letters_array.map do |item|
      item = item.map do |item|
        if lowercase.include?(item)
          item = lowercase[lowercase.index(item) + shift_factor]
        elsif uppercase.include?(item)
          item = uppercase[uppercase.index(item) + shift_factor]
        else
          item
        end
      end
      item.join("")
    end

    ciphered.join(" ")
  end
end

puts cipher("This is not a request!", 4)