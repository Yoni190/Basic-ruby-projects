require_relative '../caesar_cipher.rb'


describe '#create_array_of_ascii' do
    it 'returns array of ascii for a string' do
        string = "Hi"
        expect(create_array_of_ascii(string)).to eql([72, 105])
    end

    it 'returns array of ascii for symbols' do
        symbols = "@#$%"
        expect(create_array_of_ascii(symbols)).to eql([64, 35, 36, 37])
    end
end

describe '#shift_chars' do
    it 'returns a shifted ascii number' do
        ascii_of_a = 97
        ascii_of_A = 65
        ascii_of_z = 122
        ascii_of_Z = 90
        ascii_array = [72, 101, 108, 108, 111]

        expect(shift_chars(ascii_array, 5, ascii_of_A, ascii_of_a, ascii_of_Z, ascii_of_z)).to eql([77, 106, 113, 113, 116])
    end
end

describe '#start_from_beginning' do
    it 'returns ascii starting from beginning' do
        ascii_of_a = 97
        ascii_of_z = 122
        expect(start_from_beginning(121, 2, ascii_of_a, ascii_of_z)).to eql(98)
    end
end

describe '#is_not_letter?' do
    it 'returns true when non-letter is given' do
        symbol = 94
        expect(is_not_letter?(symbol)).to eql(true)
    end 
end

describe '#downcase_loop_needed?' do
    it 'returns true when passing z' do
        expect(downcase_loop_needed?(121, 1)).to eql(true)
    end
end

describe '#uppercase_loop_needed?' do
    it 'returns true when passing Z' do
        expect(uppercase_loop_needed?(90, 1)).to eql(true)
    end
end

describe '#change_ascii_to_char' do
    it 'returns letters' do
        ascii = [72, 101, 108, 108, 111]
        expect(change_ascii_to_char(ascii)).to eql('Hello')
    end
end