
def caesar_cipher(string, shift_factor)
  array_of_ascii = create_array_of_ascii(string)
  array_of_shifted_ascii = create_array_of_shifted_ascii(array_of_ascii, shift_factor)
  shifted_chars = create_shifted_chars(array_of_shifted_ascii)
  puts shifted_chars
end

#Change each letter to ascii
def create_array_of_ascii(string)
  string.split("").map{|char|char.ord}
end

#Increment each ascii code by the value of shift_factor
def create_array_of_shifted_ascii(array_of_ascii, shift_factor)
  ascii_of_a = 97
  ascii_of_A = 65
  ascii_of_z = 122
  ascii_of_Z = 90

  shift_chars(array_of_ascii, shift_factor, ascii_of_A, ascii_of_a, ascii_of_Z, ascii_of_z)
  
end

def shift_chars(array_of_ascii, shift_factor, ascii_of_A, ascii_of_a, ascii_of_Z, ascii_of_z)
  array_of_ascii.map do |char| 
    #Do nothing if it's not a letter
    if is_not_letter?(char)
      char
    else
      #Start from a if z is reached
      if downcase_loop_needed?(char, shift_factor)
        start_from_beginning(char, shift_factor, ascii_of_a, ascii_of_z)
      #Start from A if Z is reached
      elsif uppercase_loop_needed?(char, shift_factor)
        start_from_beginning(char, shift_factor, ascii_of_A - 1, ascii_of_Z)
      else
        char + shift_factor
      end
    end
  end
end

def start_from_beginning(char, shift_factor, ascii_beg, ascii_end)
  new_shift = char + shift_factor - ascii_end
  char = ascii_beg
  char + new_shift
end

def is_not_letter?(char)
  char.between?(32, 64) || char.between?(91,96) || char.between?(123,126) ? true : false
end

def downcase_loop_needed?(char, shift_factor)
  char + shift_factor >= 122 ? true : false
end

def uppercase_loop_needed?(char, shift_factor)
  char.between?(65,90) && char + shift_factor >= 90 ? true : false
end


def create_shifted_chars(array_of_shifted_ascii)
  array_of_shifted_ascii.map{|char| char.chr}.join
end


caesar_cipher("What a string!", 5)