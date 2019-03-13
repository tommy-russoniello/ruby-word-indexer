words = {}
files = []

ARGV.each { |file_path| files.push(File.open(file_path, "r")) }

files.each.with_index do |file, file_index|
  word_count = 1
  file.each_line do |line|
    line.split.each do |word|
      word = word.downcase.tr('—–', '-').tr('’‘′', '\'').gsub(/[^a-z0-9'\-]/i, '') unless
        word =~ /\A[0-9]+\.[0-9]+\z/
      next if word !~ /[a-z0-9]/i

      words[word] ||= { count: 0, indexes: [] }
      words[word][:count] += 1
      words[word][:indexes] += ["#{file_index + 1}-#{word_count}"]
      word_count += 1
    end
  end
end

words = words.sort do |a, b|
  a.last[:count] == b.last[:count] ? a.first <=> b.first : -(a.last[:count] <=> b.last[:count])
end

words.each do |word, stats|
  puts "'#{word}' is mentioned #{stats[:count]} time#{'s' unless stats[:count] == 1} at index" \
    "#{'es' unless stats[:count] == 1}\n  #{stats[:indexes].join(', ')}"
  puts
end
