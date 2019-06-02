require 'minruby'
require './lib/interp.rb'

str = minruby_load

tree = minruby_parse(str)

genv = {
  'p' => ['builtin', 'p'],
  'require' => ['builtin', 'require'],
  'minruby_parse' => ['builtin', 'minruby_parse'],
  'minruby_load' => ['builtin', 'minruby_load'],
  'minruby_call' => ['builtin', 'minruby_call']
}

lenv = {}

Interp.evaluate(tree, genv, lenv)
