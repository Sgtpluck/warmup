# Implement a Phrase Class here:
#
class Phrase

  def initialize(word)
    @word = word
  end

  def word_count
    @word_hash = {}
    break_word_string.each do |single_word|
      if @word_hash.include? single_word
        @word_hash[single_word]+=1
      else  
        @word_hash[single_word] = 1
      end
    end
    @word_hash
  end

  def break_word_string
    @word.downcase.split(" ")
  end


end
