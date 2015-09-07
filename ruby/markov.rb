class Generator
  def initialize(text)
    @text = text
    @initKeys = []
    @dict = self.assembleDict
    @keys = @dict.keys
    @max = @dict.length
  end

  def assembleDict()
    dict = {}
    prefix = []
    @text.scan(/\S+/).each do |word|
      if prefix.length != 0 and prefix[0] != nil
        key = prefix.join(' ')
        dict[key] ||= []
        dict[key] << word

        if is_capital(key)
          @initKeys << key
        end
      end

      prefix[0] = prefix[1]
      prefix[1] = word
    end

    return dict
  end

  def generate(count=10)
    sentences = []
    count.times do
      sentences << self.generateSentence()
    end

    sentences.join(' ')
  end

  def generateSentence()
    sentence = [].concat(self.get_init_key.split(' '))

    @max.times do
      search = sentence.last(2).join(' ')
      val = @dict[search].sample
      sentence << val

      if has_punctuation(val)
        break
      end
    end

    return sentence.join(' ')
  end

  def is_capital(key)
    key[0] == key[0].upcase
  end

  def has_punctuation(key)
    key[/\.|\?|\!/] != nil
  end

  def get_random_key
    @keys.sample
  end

  def get_init_key
    @initKeys.sample
  end
end

g = Generator.new("Detective Allen Gamble is a mild-mannered forensic accountant. Hot-tempered detective Terry 'Yankee Clipper' Hoitz is partnered with Allen ever since he mistakenly shot Derek Jeter during the World Series. Allen and Terry receive no respect from the other officers, particularly detectives Martin and Fosse. All but Terry idolize cocky detectives Chris Danson and PK Highsmith, who are considered the city's best policemen even though they frequently cause millions of dollars in property damage catching petty criminals. During a pursuit, Danson and Highsmith leap to their deaths after misjudging their ability to survive a fall, which causes the precinct to wonder why they did it and who will take their place. Allen and Terry investigate a scaffolding permit violation by multi-billionaire David Ershon but wind up uncovering a much bigger plot by Ershon to cover his losses to his client Lendl Global. Lendl CEO Pamela Boardman hires a team of mercenaries led by Roger Wesley to make sure Ershon pays her back. During their investigation, Allen confides in Terry about how he ran a college dating service, though he disputes that he was a pimp. When Allen's life spiraled out of control, he was sent to the hospital where he met his future wife Sheila, and he promised Sheila that he would never get out of control again. When Sheila tells Allen that she's pregnant, Allen reverts to his old dark personality, and she kicks him out. Meanwhile, Terry unsuccessfully attempts to reconnect with his ex-fiance Francine, who walked out on him due to his temper. Their investigation comes to a halt when Ershon's attorney, Don Beaman, learns of his plan to cover his losses, leading Wesley to kill him and make it look like a suicide. Angered at their lack of progress, Capt Gene Mauch splits up Allen and Terry, sending Terry to traffic duty and Allen to beat patrol. Despite Terry's anger, Allen still works the case on his own. After Allen learns that Danson and Highsmith died investigating a staged theft during which Wesley broke into an accounting firm next door, he finds credible evidence and earns his gun back from Mauch. Allen then convinces Terry to rejoin him. They meet Capt Mauch at Bed Bath & Beyond, his second job, where the police captain admits he has been holding off on the case because Ershon has high-profile connections that could ruin him, and he allows them to finish the case off-the-books. They go to an investment meeting Ershon is having and realize that the $32 billion Ershon seeks is really coming from the New York Police Department pension fund. They escape with Ershon to his private apartment, and Ershon tells them that the money for the pension fund is already in his account, ready to be transferred. Later that night, Allen and Terry finally reconcile with their loved ones. Allen apologizes to Sheila and she welcomes her husband back. Terry also apologizes to Francine for letting his anger rule his life. The next morning, they drive to the bank to stop the transfer, evading Wesley's team, groups of Chechen and Nigerian investors to whom Ershon owes money, and police officers who are told Allen and Terry have gone rogue. They reach the bank and halt the transfer. Wesley arrives and as a delaying tactic, shoots both officers and Ershon in their arms. Mauch finally arrives with police backup, rescuing the two and arresting Ershon for his embezzlement, and Wesley for multiple counts of murder. Ershon's arrest leads to a stock market crash and the subsequent federal bailout of Lendl Global. Terry marries Francine, and although he asks Sheila to be his best man, she declines. Sheila reunites with her husband. The narrator finishes off by stating that the true heroes are the everyday people who work to make a difference, not the ones who appear in the newspaper or on TV.")
g.generate(50000)
