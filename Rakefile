require 'rake'
require 'src/ruby/command'
require 'src/ruby/path'

GRAMMAR = "Calculator"


desc "Remove *.class and *.java files"
task :clean do
  puts "clean"
  Command.rm_rf(Path::Build, Path::Java_src)
end

desc "Generate and compile parser"
task :build => :clean do |task, args|
  puts "build"
  Command.mkdir_p(Path::Build, Path::Java_src, Path::Ruby_src).antlr_generate_source.javac
end

desc "Show parse tree"
task :tree, [:input_file] => :build do |task, args|
  puts "parse tree"
  Command.grun(args[:input_file])
end

desc "Console with all source included to classpath (like rails console)"
task :console => :build do
  Command.irb
end

desc "Execute #{GRAMMAR} interperter"
task :execute, [:input_file] => :build do |task, args|
  puts 'execute'
  Command.execute("#{Path::Ruby_src}/execute.rb #{args[:input_file]}")
end
