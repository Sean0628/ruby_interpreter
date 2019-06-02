require 'minruby'
require './lib/interp.rb'

str = minruby_load

tree = minruby_parse(str)

genv = { 'p' => ['builtin', 'p'] }
lenv = {}

Interp.evaluate(tree, genv, lenv)
