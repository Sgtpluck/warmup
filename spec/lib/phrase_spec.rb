require "./lib/phrase"

describe Phrase do

  it "should count a single word one time" do
    phrase = Phrase.new("word")
    counts = { "word" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should count each word one time" do
    phrase = Phrase.new("one of each")
    counts = { "one" => 1, "of" => 1, "each" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should count multiple occurrences one time for each occurrence" do
    phrase = Phrase.new("one fish two fish red fish blue fish")
    counts = { "one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should reset its counting hash each time it counts words" do
    phrase = Phrase.new("all the kings horses and all the kings men")

    # count the words a second time
    phrase.word_count

    counts = { "all" => 2, "the" => 2, "kings" => 2, "horses" => 1, "and" => 1, "men" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should normalize the case of the words" do
    phrase = Phrase.new("go Go GO")
    counts = { "go" => 3 }

    expect(phrase.word_count).to eq counts
  end

  it "should ignore punctuation in the phrase" do
    phrase = Phrase.new("car : carpet as java : javascript!!&@$%^&")
    counts = {"car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1}
 
    expect(phrase.word_count).to eq counts
  end
 
  it "should handle phrases that don't have spaces" do
    phrase = Phrase.new("one,two,three")
    counts = {"one" => 1, "two" => 1, "three" => 1}
 
    expect(phrase.word_count).to eq counts
  end
 
  it "should include numbers as words" do
    phrase = Phrase.new("testing, 1, 2 testing")
    counts = {"testing" => 2, "1" => 1, "2" => 1}
 
    expect(phrase.word_count).to eq counts
  end
 
  it "should be able to count words with apostrophes" do
    phrase = Phrase.new("First: don't laugh. Then: don't cry.")
    counts = {"first" => 1, "don't" => 2, "laugh" => 1, "then" => 1, "cry" => 1}
 
    expect(phrase.word_count).to eq counts
  end
end
