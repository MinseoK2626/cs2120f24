namespace cs2120f24

/-!
# Propositional Logic: Syntax
-/

structure BoolVar : Type :=
  mk :: (index: Nat)
deriving Repr

inductive UnOp : Type
| not
deriving Repr

inductive BinOp : Type
| and
| or
| imp
| iff
deriving Repr

inductive PLExpr : Type
| lit_expr (from_bool : Bool) : PLExpr
| var_expr (from_var : BoolVar)
| un_op_expr (op : UnOp) (e : PLExpr)
| bin_op_expr (op : BinOp) (e1 e2 : PLExpr)
deriving Repr

open PLExpr

notation:max " ⊤ " => (PLExpr.lit_expr true)
notation:max " ⊥ " => (lit_expr false)
notation:max "{" v "}" => (var_expr v)
notation:max "¬" p:40 => un_op_expr UnOp.not p
infixr:35 " ∧ "  =>  PLExpr.bin_op_expr BinOp.and
infixr:30 " ∨  "  => PLExpr.bin_op_expr BinOp.or
infixr:20 " ↔ " => bin_op_expr BinOp.iff
infixr:25 " ⇒ " => bin_op_expr BinOp.imp

inductive RelOp : Type
| eq
| le
| lt
| ge
| gt

end cs2120f24
