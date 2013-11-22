# Implement a Phrase Class here:
#
class Phrase

  def initialize(word)
    @word = word.downcase
  end

  def word_count
    @word_hash = {}
    remove_punc
    break_word_string.each do |single_word|
      if @word_hash.include? single_word
        @word_hash[single_word]+=1
      else  
        @word_hash[single_word] = 1
      end
    end
    @word_hash
  end

  def remove_punc
    @word.gsub!(/[?!.,:&@$%^&]/, " ")
  end

  def break_word_string #this turns the phrase into an array of words
    @word.split(" ")
  end


end
