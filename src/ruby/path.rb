module Path
  extend self

  Antlr     = "/usr/share/java/antlr-complete.jar"
  Grammar   = "grammar"
  Build     = "build"
  Java_src  = "src/java"
  Ruby_src  = "src/ruby"

  def classes
    [Build, Antlr].join(':')
  end
end
