
def caesar_cipher(string, shift_factor)
  array_of_ascii = create_array_of_ascii(string)
  array_of_shifted_ascii = create_array_of_shifted_ascii(array_of_ascii, shift_factor)
  shifted_chars = change_ascii_to_char(array_of_shifted_ascii)
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
  array_of_ascii.map do |ascii| 
    #Do nothing if it's not a letter
    if is_not_letter?(ascii)
      ascii
    else
      #Start from a if z is reached
      if downcase_loop_needed?(ascii, shift_factor)
        start_from_beginning(ascii, shift_factor, ascii_of_a, ascii_of_z)
      #Start from A if Z is reached
      elsif uppercase_loop_needed?(ascii, shift_factor)
        start_from_beginning(ascii, shift_factor, ascii_of_A - 1, ascii_of_Z)
      else
        ascii + shift_factor
      end
    end
  end
end

def start_from_beginning(ascii, shift_factor, ascii_beg, ascii_end)
  new_shift = ascii + shift_factor - ascii_end
  ascii = ascii_beg
  ascii + new_shift
end

def is_not_letter?(ascii)
  ascii.between?(32, 64) || ascii.between?(91,96) || ascii.between?(123,126) ? true : false
end

def downcase_loop_needed?(ascii, shift_factor)
  ascii + shift_factor >= 122 ? true : false
end

def uppercase_loop_needed?(ascii, shift_factor)
  ascii.between?(65,90) && ascii + shift_factor >= 90 ? true : false
end


def change_ascii_to_char(array_of_shifted_ascii)
  array_of_shifted_ascii.map{|ascii| ascii.chr}.join
end


caesar_cipher("What a string!", 5)