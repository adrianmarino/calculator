module Path
  extend self

  Antlr_complete  = "/usr/share/java/antlr-complete.jar"
  Grammar         = "grammar"
  Build           = "build"

  module Source
    Java = "src/java"
    Ruby = "src/ruby"
  end

  def classes
    [Build, Antlr_complete].join(':')
  end
end
