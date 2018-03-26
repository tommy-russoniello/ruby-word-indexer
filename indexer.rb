WORDS = {}
FILES = []

ARGV.each { |file_path| FILES.push(File.open(file_path, "r")) }

file_count = 1
FILES.each do |file|
  word_count = 1
  file.each_line do |line|
    words = line.split
    words.each do |word|
      word = word.downcase.tr('—–', '-').tr('’‘′', '\'').gsub(/[^a-z0-9'\-]/i, '') unless word =~ /\A[0-9]+\.[0-9]+\z/
      next if word !~ /[a-z0-9]/i
      WORDS[word] = ! WORDS[word]? { count: 1, indexes: ["#{file_count}-#{word_count}"] } :
      { count: WORDS[word][:count] += 1,indexes: WORDS[word][:indexes] + ["#{file_count}-#{word_count}"] }
      word_count += 1
    end
  end

  file_count += 1
end

WORDS.sort { |a,b| -(a[1][:count] <=> b[1][:count]) }.each do |word, stats|
  puts "'#{word}' is mentioned #{stats[:count]} time#{'s' unless stats[:count] == 1} at index\
#{'es' unless stats[:count] == 1}\n  #{stats[:indexes].join(', ')}"
end
