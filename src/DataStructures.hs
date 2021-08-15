module DataStructures where


newtype InvalidSyntaxError = InvalidSyntaxError String
  deriving (Show)

data Prog = Prog Def RestProg
  deriving (Show)

data RestProg = Deps | RProg Prog
  deriving (Show)

data Def = Def Var RestVars Expr
  deriving (Show)

data RestVars = Veps | RVars Var RestVars
  deriving (Show)

data LocDefs = LocDefs LocDef RestLocDefs
  deriving (Show)

data RestLocDefs = LDeps | RLocDefs LocDefs
  deriving (Show)

data LocDef = LocDef Var Expr
  deriving (Show)

-- data Expr
--   = LetIn LocDefs Expr
--   | IfElseThen Expr Expr Expr
--   | Or Expr Expr
--   | And Expr Expr
--   | CompEq Expr Expr
--   | CompSmaller Expr Expr
--   | Plus Expr Expr
--   | Minus Expr Expr
--   | UnMinus Expr
--   | Times Expr Expr
--   | Divided Expr Expr
--   | Variable String
--   | Int Int
--   | Bool Bool
--   | Appl Expr Expr
--   deriving (Show)
  
data Expr
  = LetIn LocDefs Expr
  | IfElseThen Expr Expr Expr
  | Expr1' Expr1
  deriving (Show)

data EndToken = EndToken
  deriving (Show)

data Expr1 = Expr1 Expr2 RestExpr1
  deriving (Show)

data RestExpr1 = RE1eps | OR Expr
  deriving (Show)

data Expr2 = Expr2 Expr3 RestExpr2
  deriving (Show)

data RestExpr2 = RE2eps | AND Expr
  deriving (Show)

data Expr3 = Expr3 Expr4 RestExpr3
  deriving (Show)

data RestExpr3 = RE3eps | CompEq' Expr | CompSmaller' Expr
  deriving (Show)

data Expr4 = Expr4 Expr5 RestExpr4
  deriving (Show)

data RestExpr4 = RE4eps | PLUS Expr | MINUS Expr
  deriving (Show)

data Expr5 = NotNeg | NegExpr5 Expr
  deriving (Show)

data Expr6 = Expr6 Expr7 RestExpr6
  deriving (Show)

data RestExpr6 = RE6eps | MULT Expr | DIV Expr
  deriving (Show)

data Expr7 = Expr7 AtomicExpr RestExpr7
  deriving (Show)

data RestExpr7 = RE7eps | App Expr7
  deriving (Show)

data AtomicExpr = AtomExpr AtomExpr | Parenthesised Expr
  deriving (Show)

newtype Var = Name String
  deriving (Show, Eq)

data BinaryOp
  = BO_AND
  | BO_OR
  | BO_EQUAL
  | BO_SMALLER
  | BO_PLUS
  | BO_MINUS
  | BO_MUL
  | BO_DIV
  deriving (Show, Eq)

data UniOp
  = UO_NOT
  | UO_MINUS
  deriving (Show, Eq)

data AtomExpr
  = T_VAR Var
  | T_INT Int
  | T_BOOL Bool
  deriving (Show, Eq)

data Token
  = TAtomExpr AtomExpr
  | TBinOp BinaryOp
  | TUniOp UniOp
  | T_MAIN
  | T_LET
  | T_IN
  | T_IF
  | T_THEN
  | T_ELSE
  | TLPAREN
  | TRPAREN
  | TNULL
  | TSEMICOL
  | TEQUAL
  | Error String
  deriving (Show, Eq)

data Context = CtxDef | CtxLocalDef | CtxOther
  deriving (Show)
