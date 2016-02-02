require 'rake'
require 'src/ruby/command'
require 'src/ruby/path'

GRAMMAR = "Calculator"

task :clean do
  puts "clean"
  Command.rm_rf(Path::Build, Path::Java_src)
end

task :build => :clean do |task, args|
  puts "build"
  Command.mkdir_p(Path::Build, Path::Java_src, Path::Ruby_src).antlr_generate_source.javac
end

task :tree, [:input_file] => :build do |task, args|
  puts "parse tree"
  Command.grun(args[:input_file])
end

task :console => :build do
  Command.irb
end

task :execute, [:input_file] => :build do |task, args|
  puts 'execute'
  Command.execute("#{Path::Ruby_src}/execute.rb #{args[:input_file]}")
end
