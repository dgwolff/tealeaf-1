# Reverse madlibs

nouns = File.open('reverse_madlibs_nouns.txt', 'r') do |f|
  f.read
end.split

verbs = File.open('reverse_madlibs_verbs.txt', 'r') do |f|
  f.read
end.split

adjectives = File.open('reverse_madlibs_adjectives.txt', 'r') do |f|
  f.read
end.split

def say(msg)
  puts("=> #{msg}")
end

def exit_with(msg)
  say msg
  exit
end

def get_input(word)
  say "Input a #{word}:"
  STDIN.gets.chomp
end

exit_with('No input file!') if ARGV.empty?
exit_with("File doesn't exist!") unless File.exist?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

contents.gsub!('NOUN').each do |noun|
  get_input(noun)
end

contents.gsub!('VERB').each do
  verbs.sample
end

contents.gsub!('ADJECTIVE').each do
  adjectives.sample
end

p contents
