module Expr where

import Data.Map (Map)

type Context = Map String Expr

data Expr = LispFloat Double |
            LispInteger Integer |
            LispBoolean Bool |
            LispChar Char |
            LispFunction (Context -> [Expr] -> (Context, Expr)) |
            LispSymbol String |
            LispDataList [Expr] |
            LispRangeList Expr Expr |
            LispRangeList2 Expr Expr Expr |
            LispInfRangeList Expr |
            LispInfRangeList2 Expr Expr |
            LispList [Expr] |
            LispError String |
            LispDo [Expr]

instance Show Expr where
    show (LispFloat val) = show val
    show (LispInteger val) = show val
    show (LispBoolean val) = if val then "true" else "false"
    show (LispChar val) = show val
    show (LispFunction _) = "[function]"
    show (LispSymbol val) = val
    show (LispDataList val) = "[" ++ unwords (map show val) ++ "]"
    show (LispList val) = "(" ++ unwords (map show val) ++ ")"
    show (LispError val) = "Error : " ++ val
    show _ = "[undefined]"