
class Interp
  def self.evaluate(tree, genv, lenv)
    case tree[0]
    when 'lit'
      tree[1]
    when '+'
      evaluate(tree[1], genv, lenv) + evaluate(tree[2], genv, lenv)
    when '-'
      evaluate(tree[1], genv, lenv) - evaluate(tree[2], genv, lenv)
    when '*'
      evaluate(tree[1], genv, lenv) * evaluate(tree[2], genv, lenv)
    when '/'
      evaluate(tree[1], genv, lenv) / evaluate(tree[2], genv, lenv)
    when '%'
      evaluate(tree[1], genv, lenv) % evaluate(tree[2], genv, lenv)
    when '=='
      evaluate(tree[1], genv, lenv) == evaluate(tree[2], genv, lenv)
    when '<'
      evaluate(tree[1], genv, lenv) < evaluate(tree[2], genv, lenv)
    when '>'
      evaluate(tree[1], genv, lenv) > evaluate(tree[2], genv, lenv)
    when '<='
      evaluate(tree[1], genv, lenv) <= evaluate(tree[2], genv, lenv)
    when '>='
      evaluate(tree[1], genv, lenv) >= evaluate(tree[2], genv, lenv)
    when 'func_call'
      p evaluate(tree[2], genv, lenv)
    when 'stmts'
      i = 1
      last = nil
      while tree[i]
        last = evaluate(tree[i], genv, lenv)
        i += 1
      end
      last
    when 'var_assign'
      lenv[tree[1]] = evaluate(tree[2], genv, lenv)
    when 'var_ref'
      lenv[tree[1]]
    when 'if'
      if evaluate(tree[1], genv, lenv)
        evaluate(tree[2], genv, lenv)
      else
        evaluate(tree[3], genv, lenv)
      end
    when 'while'
      while evaluate(tree[1], genv, lenv)
        evaluate(tree[2], genv, lenv)
      end
    when 'while2'
      evaluate(tree[2], genv, lenv)
      while evaluate(tree[1], genv, lenv)
        evaluate(tree[2], genv, lenv)
      end
    end
  end
end

