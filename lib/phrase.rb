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

  private

  def remove_punc # making a new variable to store the punctuationless phrase to keep the original variable intact
    @no_punc = @word.gsub(/[?!.,:&@$%^&]/, ' ')
  end

  def break_word_string # this turns the phrase without punctuation into an array of words
    @no_punc.split(' ')
  end

end
