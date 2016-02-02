module Path
  extend self

  Antlr   = "/usr/share/java/antlr-complete.jar"
  Grammar = "grammar"
  Build   = "build"

  module Source
    Java = "src/java"
    Ruby = "src/ruby"
  end

  def classes
    [Build, Antlr].join(':')
  end
end
