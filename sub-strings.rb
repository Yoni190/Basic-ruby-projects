def substrings(string, array_of_substrings)
  string_array = string.split(" ")
  hashes = {}
  string_array.map do |word|
    array_of_substrings.map do |dic_word|
      if word.downcase.include?(dic_word)
        if hashes.has_key?(dic_word)
          hashes[dic_word] += 1
        else
          hashes[dic_word] = 1
        end
      end
    end
  end.compact
  print hashes
end

dictionary = %w(below below down go going horn how howdy it i low own part partner sit)
substrings("Howdy partner, sit down! How's it going?", dictionary)