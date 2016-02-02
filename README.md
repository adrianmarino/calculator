# Calculator
antlr calculator

###  Requisites

* JRuby
```bash
rvm install jruby
rvm use jruby
```

* Antlr4 (On Arch linux)
```bash
yaourt -S antlr4
alias grun='java -cp .:/usr/share/java/antlr-complete.jar org.antlr.v4.runtime.misc.TestRig "$@"'
```

###  Test

```bash
rake tree[tests/test2.calc]
```

```bash
rake execute[tests/test2.calc]
```
