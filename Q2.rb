def calcARI(filename)
  char_num = word_num = sent_num = 0
  File.open(filename).each{|line| 
    #scan (\w) to count character number
    char_num = line.scan(/\w/).length + 1
    #scan (\s) to count word number, plus 1 since omit last space
    word_num = line.scan(/\s/).length + 1
    #scan (. ? !) to determine whether is a sentence.
    sent_num = line.scan(/\.|\?|\!/).length  
  }

  #calculate ARI  
  calculateARI= ((4.71*(char_num.to_f/word_num)) + (0.5 * (word_num.to_f/sent_num))) -21.43

  puts "Total # of characters: #{char_num}"
  puts "Total # of words: #{word_num}"
  puts "Total # of sentences: #{sent_num}"
  puts "Automated Readability Index: #{calculateARI.round(1)}"
  # determine grade level
  case calculateARI
    #range is [1,2)
     when 1...2  
        puts "Grade level: 5-6 (Kindergarten)"
     when 2...3
        puts "Grade level: 6-7 (First/Second Grade)"
     when 3...4
        puts "Grade level: 7-9 (Third Grade)"
     when 4...5
        puts "Grade level: 9-10 (Fourth Grade)"
     when 5...6
        puts "Grade level: 10-11 (Fifth Grade)"
     when 6...7
        puts "Grade level: 11-12 (Sixth Grade)"
     when 7...8
        puts "Grade level: 12-13 (Seventh Grade)"
     when 8...9
        puts "Grade level: 13-14 (Eighth Grade)"
     when 9...10
        puts "Grade level: 14-15 (Ninth Grade)"
     when 10...11
        puts "Grade level: 15-16 (Tenth Grade)"
     when 11...12
        puts "Grade level: 16-17 (Eleventh Grade)"
     when 12...13
        puts "Grade level: 17-18 (Twelfth grade)"
     when 13...14
        puts "Grade level: 18-24 (College student)"
     when 14
        puts "Grade level: 24+ (Professor)"
     else
        puts "Error Grade!"
     end

end

filename = "paragraph.txt"
calcARI(filename)