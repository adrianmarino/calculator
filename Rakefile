require 'rake'
GRUN="java -cp .:/usr/share/java/antlr-complete.jar org.antlr.v4.runtime.misc.TestRig"

task :clean do
  extensions = %w[*.class *.java *.tokens]
  puts "Clean #{extensions}"
  extensions.each { |ext| `rm -rf #{ext}` }
end

task :generate, [:grammar] => :clean do |task, args|
  grammar = args[:grammar]
  puts "Generate #{grammar} lexer and parser."
  `antlr4 #{grammar}.g4`
  `javac *.java`
end

task :test, [:grammar, :input_file] => :generate do |task, args|
  grammar = args[:grammar]
  args.with_defaults(:start_rule => grammar.downcase)
  input_file = args[:input_file]
  start_rule = args[:start_rule]

  puts "Parse #{input_file} with #{grammar} gramar"
  `#{GRUN} #{grammar} #{start_rule} -gui #{input_file}`
end
