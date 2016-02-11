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

```bash
rake console
> require 'calculator'
> Calculator.eval('tests/test2.calc')
 => [4.0, 0.25, 4.25, 14.0, 14.0, -4.0, -6.0, 12.0, 17.150000000000002, 2.0]
```

## License

Calculator is released under the [MIT License](http://www.opensource.org/licenses/MIT).
