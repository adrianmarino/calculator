require 'fileutils'

module Command
  extend self

  def rm_rf(*paths)
    FileUtils.rm_rf(paths)
    self
  end

  def mkdir_p(*paths)
    FileUtils.mkdir_p(paths)
    self
  end

  def javac(source_path = Path::Java_src, output_path = Path::Build)
    `javac #{source_path}/*.java -d #{output_path}`
    self
  end

  def antlr_generate_source(grammar = GRAMMAR, output_path = Path::Java_src)
    `cd #{Path::Grammar}; antlr4 -no-listener -visitor #{grammar}.g4 -o ../#{output_path}`
    self
  end

  def grun(input_file, grammar = GRAMMAR, start_rule = GRAMMAR.downcase )
    exec `cd #{Path::Build}; grun #{grammar} #{start_rule} -gui ../#{input_file}`
  end

  def irb
    execute(:irb)
  end

  def execute(command, class_path = Path.classes)
    exec "ruby -J-cp #{class_path} -I #{Path::Ruby_src} -S #{command.to_s}"
  end
end
