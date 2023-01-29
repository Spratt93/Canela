data Exp = ReadOp FileList Operation
         | Read FileList
         | SeqExp Exp Exp

data FileList = File String
              | Files FileList FileList 

data Operation = Where Cond
               | WhereSeq Cond IfStmt

data Cond = GT Operand Operand
          | GTE Operand Operand
          | LT Operand Operand
          | LTE Operand Operand
          | EQ Operand Operand
          | And Cond Cond
          | Or Cond Cond

data IfStmt = If Cond Action
            | IfElse Cond Action Action
            | SeqIfs IfStmt IfStmt

data NestedIfStmt = NIf Cond Action
                  | NIfElse Cond Action Action

data Action = Change Operand Operand Operand
            | Insert Operand Operand Operand
            | Drop
            | SeqActs Action Action
            | NestedIfStmt

data Operand = Subject String
             | Predicate String
             | Object String
             | String String
             | Bool Bool
             | Int Int
