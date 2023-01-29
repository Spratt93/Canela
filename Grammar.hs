{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import System.Environment
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,132) ([2048,0,0,2,0,0,8192,0,4,0,0,512,1024,0,0,0,32,32,0,4096,0,0,0,0,0,512,0,0,0,0,0,0,32768,7,48,4,0,112,0,512,0,0,0,0,0,0,0,6,0,4096,0,0,4,14,0,0,30784,0,4096,30,0,1920,0,57344,1,0,120,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,57344,1,0,0,0,7680,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,480,4096,0,0,0,0,192,16,32768,0,0,1808,0,0,0,16384,12,0,0,2,0,0,0,0,30,0,1920,0,57344,1,0,120,0,7680,0,113,0,7232,0,0,0,0,33,0,0,0,12288,1024,0,0,120,0,7680,0,128,0,8192,0,8192,0,0,0,0,28928,0,0,0,0,0,0,12544,0,0,113,0,0,0,33792,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTurtle","Exp","FileList","Operation","Cond","IfStmt","NestedIfStmt","Action","Operand","READ","WHERE","SUBJ","PRED","OBJ","AND","OR","IF","THEN","ELSE","END","DROP","CHANGE","INSERT","'.'","'<'","'>'","'='","'('","')'","'+'","'-'","file","string","bool","int","%eof"]
        bit_start = st Prelude.* 38
        bit_end = (st Prelude.+ 1) Prelude.* 38
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..37]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (12) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (34) = happyShift action_6
action_2 (5) = happyGoto action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (17) = happyShift action_7
action_3 (38) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (34) = happyShift action_6
action_4 (5) = happyGoto action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (13) = happyShift action_10
action_5 (6) = happyGoto action_9
action_5 _ = happyReduce_2

action_6 (34) = happyShift action_6
action_6 (5) = happyGoto action_12
action_6 _ = happyReduce_5

action_7 (12) = happyShift action_4
action_7 (4) = happyGoto action_11
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (13) = happyShift action_10
action_8 (6) = happyGoto action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_1

action_10 (30) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_3

action_12 _ = happyReduce_4

action_13 (34) = happyShift action_16
action_13 (35) = happyShift action_17
action_13 (36) = happyShift action_18
action_13 (37) = happyShift action_19
action_13 (7) = happyGoto action_14
action_13 (11) = happyGoto action_15
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (17) = happyShift action_26
action_14 (18) = happyShift action_27
action_14 (31) = happyShift action_28
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (27) = happyShift action_23
action_15 (28) = happyShift action_24
action_15 (29) = happyShift action_25
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (26) = happyShift action_22
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_28

action_18 _ = happyReduce_29

action_19 (32) = happyShift action_20
action_19 (33) = happyShift action_21
action_19 _ = happyReduce_30

action_20 (37) = happyShift action_41
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (37) = happyShift action_40
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (14) = happyShift action_37
action_22 (15) = happyShift action_38
action_22 (16) = happyShift action_39
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (29) = happyShift action_36
action_23 (34) = happyShift action_16
action_23 (35) = happyShift action_17
action_23 (36) = happyShift action_18
action_23 (37) = happyShift action_19
action_23 (11) = happyGoto action_35
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (29) = happyShift action_34
action_24 (34) = happyShift action_16
action_24 (35) = happyShift action_17
action_24 (36) = happyShift action_18
action_24 (37) = happyShift action_19
action_24 (11) = happyGoto action_33
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (34) = happyShift action_16
action_25 (35) = happyShift action_17
action_25 (36) = happyShift action_18
action_25 (37) = happyShift action_19
action_25 (11) = happyGoto action_32
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (34) = happyShift action_16
action_26 (35) = happyShift action_17
action_26 (36) = happyShift action_18
action_26 (37) = happyShift action_19
action_26 (7) = happyGoto action_31
action_26 (11) = happyGoto action_15
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (34) = happyShift action_16
action_27 (35) = happyShift action_17
action_27 (36) = happyShift action_18
action_27 (37) = happyShift action_19
action_27 (7) = happyGoto action_30
action_27 (11) = happyGoto action_15
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (17) = happyShift action_29
action_28 _ = happyReduce_7

action_29 (19) = happyShift action_45
action_29 (8) = happyGoto action_44
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_14

action_31 _ = happyReduce_13

action_32 _ = happyReduce_12

action_33 _ = happyReduce_8

action_34 (34) = happyShift action_16
action_34 (35) = happyShift action_17
action_34 (36) = happyShift action_18
action_34 (37) = happyShift action_19
action_34 (11) = happyGoto action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_10

action_36 (34) = happyShift action_16
action_36 (35) = happyShift action_17
action_36 (36) = happyShift action_18
action_36 (37) = happyShift action_19
action_36 (11) = happyGoto action_42
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_25

action_38 _ = happyReduce_26

action_39 _ = happyReduce_27

action_40 _ = happyReduce_32

action_41 _ = happyReduce_31

action_42 _ = happyReduce_11

action_43 _ = happyReduce_9

action_44 _ = happyReduce_6

action_45 (30) = happyShift action_46
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (34) = happyShift action_16
action_46 (35) = happyShift action_17
action_46 (36) = happyShift action_18
action_46 (37) = happyShift action_19
action_46 (7) = happyGoto action_49
action_46 (11) = happyGoto action_15
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_45
action_47 (8) = happyGoto action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_17

action_49 (17) = happyShift action_26
action_49 (18) = happyShift action_27
action_49 (31) = happyShift action_50
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (20) = happyShift action_51
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (19) = happyShift action_54
action_51 (23) = happyShift action_55
action_51 (24) = happyShift action_56
action_51 (25) = happyShift action_57
action_51 (9) = happyGoto action_52
action_51 (10) = happyGoto action_53
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_24

action_53 (17) = happyShift action_61
action_53 (21) = happyShift action_62
action_53 (22) = happyShift action_63
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (30) = happyShift action_60
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_22

action_56 (34) = happyShift action_16
action_56 (35) = happyShift action_17
action_56 (36) = happyShift action_18
action_56 (37) = happyShift action_19
action_56 (11) = happyGoto action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (34) = happyShift action_16
action_57 (35) = happyShift action_17
action_57 (36) = happyShift action_18
action_57 (37) = happyShift action_19
action_57 (11) = happyGoto action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (34) = happyShift action_16
action_58 (35) = happyShift action_17
action_58 (36) = happyShift action_18
action_58 (37) = happyShift action_19
action_58 (11) = happyGoto action_68
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (34) = happyShift action_16
action_59 (35) = happyShift action_17
action_59 (36) = happyShift action_18
action_59 (37) = happyShift action_19
action_59 (11) = happyGoto action_67
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (34) = happyShift action_16
action_60 (35) = happyShift action_17
action_60 (36) = happyShift action_18
action_60 (37) = happyShift action_19
action_60 (7) = happyGoto action_66
action_60 (11) = happyGoto action_15
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (19) = happyShift action_54
action_61 (23) = happyShift action_55
action_61 (24) = happyShift action_56
action_61 (25) = happyShift action_57
action_61 (9) = happyGoto action_52
action_61 (10) = happyGoto action_65
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (19) = happyShift action_54
action_62 (23) = happyShift action_55
action_62 (24) = happyShift action_56
action_62 (25) = happyShift action_57
action_62 (9) = happyGoto action_52
action_62 (10) = happyGoto action_64
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_15

action_64 (17) = happyShift action_61
action_64 (22) = happyShift action_72
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_23

action_66 (17) = happyShift action_26
action_66 (18) = happyShift action_27
action_66 (31) = happyShift action_71
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (34) = happyShift action_16
action_67 (35) = happyShift action_17
action_67 (36) = happyShift action_18
action_67 (37) = happyShift action_19
action_67 (11) = happyGoto action_70
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (34) = happyShift action_16
action_68 (35) = happyShift action_17
action_68 (36) = happyShift action_18
action_68 (37) = happyShift action_19
action_68 (11) = happyGoto action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (26) = happyShift action_75
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (26) = happyShift action_74
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (20) = happyShift action_73
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_16

action_73 (19) = happyShift action_54
action_73 (23) = happyShift action_55
action_73 (24) = happyShift action_56
action_73 (25) = happyShift action_57
action_73 (9) = happyGoto action_52
action_73 (10) = happyGoto action_76
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_20

action_75 _ = happyReduce_21

action_76 (17) = happyShift action_61
action_76 (21) = happyShift action_77
action_76 (22) = happyShift action_78
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (19) = happyShift action_54
action_77 (23) = happyShift action_55
action_77 (24) = happyShift action_56
action_77 (25) = happyShift action_57
action_77 (9) = happyGoto action_52
action_77 (10) = happyGoto action_79
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_18

action_79 (17) = happyShift action_61
action_79 (22) = happyShift action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_19

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (ReadOp happy_var_2 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Read happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (SeqExps happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn5
		 (Files (File happy_var_1) happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn5
		 (File happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happyReduce 6 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (WhereSeq happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Where happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (Gt happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 7 happyReduction_9
happyReduction_9 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Gte happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (Lt happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 7 happyReduction_11
happyReduction_11 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Lte happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (Eql happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (And happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Or happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 7 8 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 9 8 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfElse happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (SeqIfs happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 7 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (NIf happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 9 9 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (NIfElse happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 5 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Change happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Insert happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  10 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn10
		 (Drop
	)

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (SeqActs happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (Nested happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 _
	_
	(HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn11
		 (Subject happy_var_1
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 _
	_
	(HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn11
		 (Predicate happy_var_1
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 _
	_
	(HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn11
		 (Object happy_var_1
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn11
		 (String happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  11 happyReduction_29
happyReduction_29 (HappyTerminal (TokenBool _ happy_var_1))
	 =  HappyAbsSyn11
		 (Bool happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  11 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn11
		 (Int happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  11 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn11
		 (Add happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn11
		 (Subtract happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 38 38 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenRead _ -> cont 12;
	TokenWhere _ -> cont 13;
	TokenSubj _ -> cont 14;
	TokenPred _ -> cont 15;
	TokenObj _ -> cont 16;
	TokenAnd _ -> cont 17;
	TokenOr _ -> cont 18;
	TokenIf _ -> cont 19;
	TokenThen _ -> cont 20;
	TokenElse _ -> cont 21;
	TokenEnd _ -> cont 22;
	TokenDrop _ -> cont 23;
	TokenChange _ -> cont 24;
	TokenInsert _ -> cont 25;
	TokenDot _ -> cont 26;
	TokenLBrack _ -> cont 27;
	TokenRBrack _ -> cont 28;
	TokenEq _ -> cont 29;
	TokenLParen _ -> cont 30;
	TokenRParen _ -> cont 31;
	TokenPlus _ -> cont 32;
	TokenMinus _ -> cont 33;
	TokenFile _ happy_dollar_dollar -> cont 34;
	TokenString _ happy_dollar_dollar -> cont 35;
	TokenBool _ happy_dollar_dollar -> cont 36;
	TokenInt _ happy_dollar_dollar -> cont 37;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 38 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseTurtle tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp = ReadOp FileList Operation
         | Read FileList
         | SeqExps Exp Exp
         deriving Show

data FileList = Files FileList FileList
              | File String
              deriving Show

data Operation = Where Cond
               | WhereSeq Cond IfStmt
               deriving Show

data Cond = Gt Operand Operand
          | Gte Operand Operand
          | Lt Operand Operand
          | Lte Operand Operand
          | Eql Operand Operand
          | And Cond Cond
          | Or Cond Cond
          deriving Show

data IfStmt = If Cond Action
            | IfElse Cond Action Action
            | SeqIfs IfStmt IfStmt
            deriving Show

data NestedIfStmt = NIf Cond Action
                  | NIfElse Cond Action Action
                  deriving Show

data Action = Change Operand Operand Operand
            | Insert Operand Operand Operand
            | Drop
            | SeqActs Action Action
            | Nested NestedIfStmt
            deriving Show

data Operand = Subject String
             | Predicate String
             | Object String
             | String String
             | Bool Bool
             | Int Int
             | Add Int Int
             | Subtract Int Int
             deriving Show

main = do args <- getArgs
          input <- readFile (args !! 0)
          print $ parseTurtle $ alexScanTokens input
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
