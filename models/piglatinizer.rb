class PigLatinizer
  attr_accessor :the_bits
  def initialize(input = "")
    @the_bits = piglatinize(input)
  end

  def pg_word(word)
    if starts_with_vowel?(word)
      word + "way"
    else
      #shuffle until first letter is vowel
      pg_word = word
      until starts_with_vowel?(pg_word) do
        pg_word = shuffle_first_letter(pg_word)
      end
      pg_word + "ay"
    end
  end

  def shuffle_first_letter(word)
    letters = word.split("")
    first_letter = letters.shift
    letters << first_letter
    letters.join
  end
  def starts_with_vowel?(word)
    word.start_with?(/[aeiouAEIOU]/)
  end
  def piglatinize(phrase)
    sentence = []
    words = phrase.split(" ")
    words.each do |w|
      sentence << pg_word(w)
    end
    sentence.join(" ")
  end
end
