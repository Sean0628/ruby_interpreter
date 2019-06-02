require 'minitest/autorun'
require './lib/interp.rb'

class InterpTest < Minitest::Test
  def setup
    @genv = { 'p' => ['builtin', 'p'] }
    @lenv = {}
  end

  def test_eval_literal
    assert_equal 1,  Interp.evaluate(['lit', 1], @genv, @lenv)
  end

  def test_eval_arithmetic_operators
    assert_equal 3,    Interp.evaluate(['+', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal (-1), Interp.evaluate(['-', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal 2,    Interp.evaluate(['*', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal 0,    Interp.evaluate(['/', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal 1,    Interp.evaluate(['%', ['lit', 1], ['lit', 2]], @genv, @lenv)
  end

  def test_eval_logical_operators
    assert_equal true,  Interp.evaluate(['<' , ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal true,  Interp.evaluate(['<=', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal false, Interp.evaluate(['==', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal false, Interp.evaluate(['>=', ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal false, Interp.evaluate(['>' , ['lit', 1], ['lit', 2]], @genv, @lenv)
  end

  def test_eval_statement
    assert_equal 3, Interp.evaluate(['stmts', ['lit', 1], ['lit', 2], ['lit', 3]], @genv, @lenv)
  end

  def test_eval_variable
    assert_equal 1, Interp.evaluate(['stmts', ['var_assign', 'x', ['lit', 1]], ['var_ref', 'x']], @genv, @lenv)
  end

  def test_eval_if_statement
    assert_equal 1, Interp.evaluate(['if', ['lit', true], ['lit', 1], ['lit', 2]], @genv, @lenv)
    assert_equal 1, Interp.evaluate(['if', ['lit', true], ['lit', 1], nil], @genv, @lenv)
    assert_equal 1, Interp.evaluate(['if', ['lit', true], ['lit', 1], nil], @genv, @lenv)
  end
end
