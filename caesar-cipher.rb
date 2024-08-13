def caesar_cipher(string, shift_factor)
  array_of_ascii = string.split("").map{|char|char.ord}
  array_of_shifted_ascii = array_of_ascii.map do
    |char| 
    if char.between?(32, 64) || char.between?(91,96) || char.between?(123,126)
      char
    else
      if char + shift_factor >= 122
        new_shift = char + shift_factor - 122
        char = 97
        char + new_shift
      elsif char.between?(65,90) && char + shift_factor >= 90
        new_shift = char + shift_factor - 90
        char = 64
        char + new_shift
      else
        char + shift_factor
      end
    end
  end
  shifted_chars = array_of_shifted_ascii.map{|char| char.chr}.join
  puts shifted_chars
end


caesar_cipher("What a string!", 5)