def ceaser_cipher(phrase, shiftnum)
    #makes array of characters and then converts into character codes
    phrase_length = phrase.length
    phrase_array = phrase.split("")
    code_array = []
    code_cipher_array = []





    i = 0
    while i < phrase_length do
        code_array[i] = phrase_array[i].ord
        i += 1
    end

    #identifies if shift is too large and rounds it to fit in single alphabet
    if shiftnum > 26
        shiftfactor = shiftnum / 26 
        roundfactor = shiftfactor.floor
        shiftnum = shiftnum - (roundfactor * 26)
    elsif shiftnum < -26
        shiftfactor = shiftnum / 26
        roundfactor = shiftfactor.ceil
        shiftnum = shiftnum - (roundfactor * 26)
    end


    #shifts codes and skips punctuations
    j = 0
    while j < phrase_length do
        if code_array[j] > 64 && code_array[j] < 91
            code_cipher_array[j] = code_array[j] + shiftnum
                if code_cipher_array[j] > 90
                    code_cipher_array[j] = code_cipher_array[j] - 26         
                elsif code_cipher_array[j] < 65
                    code_cipher_array[j] = code_cipher_array[j] + 26
                end
        elsif code_array[j] > 96 && code_array[j] < 122
            code_cipher_array[j] = code_array[j] + shiftnum
                if code_cipher_array[j] > 121
                    code_cipher_array[j] = code_cipher_array[j] - 26
                elsif code_cipher_array[j] < 97
                    code_cipher_array[j] = code_cipher_array[j] + 26
                end
        else
            code_cipher_array[j] = code_array[j]
        end
        j += 1
    end

    #convert codes back to string and print
    k = 0
    ciphered_phrase = ""
    while k < phrase_length do
        ciphered_phrase = ciphered_phrase + code_cipher_array[k].chr
    k += 1
    end
    return ciphered_phrase
end

puts "What is the phrase?"

the_phrase = gets.chomp
the_phrase = the_phrase.to_s

puts "what is the shift?"
the_shift = gets.chomp
the_shift = the_shift.to_i

puts "Your new phrase is:"

puts ceaser_cipher(the_phrase, the_shift)

