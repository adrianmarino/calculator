require 'rake'

CLASS_PATH = "-cp .:/usr/share/java/antlr-complete.jar"
JAVA = "java #{CLASS_PATH}"

task :clean do
  extensions = %w[*.class *.java *.tokens]
  puts "Clean #{extensions}"
  extensions.each do |ext|
    `ls #{ext} | grep -v Calculator.java | grep -v CalculatorVisitorImpl.java | xargs rm -fr`
  end
end

task :build, [:grammar] => :clean do |task, args|
  grammar = args[:grammar]
  puts "Build #{grammar}"
  `antlr4 -no-listener -visitor #{grammar}.g4`
  `javac *.java`
end

task :tree, [:grammar, :input_file] => :build do |task, args|
  grammar = args[:grammar]
  args.with_defaults(:start_rule => grammar.downcase)
  input_file = args[:input_file]
  start_rule = args[:start_rule]

  puts "Parse #{input_file} with #{grammar} gramar"
  `#{JAVA} org.antlr.v4.runtime.misc.TestRig #{grammar} #{start_rule} -gui #{input_file}`
end

task :execute, [:grammar, :input_file] => :build do |task, args|
  grammar = args[:grammar]
  input_file = args[:input_file]

  puts "Execute #{grammar}\n"

  if input_file
    input_content = `cat #{input_file}`
    puts "input>\n#{input_content}"
  else
    puts "input>"
  end

  puts `#{JAVA} #{grammar} #{input_file}`
end
