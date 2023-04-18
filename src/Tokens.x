{ 
module Tokens where 
}

%wrapper "basic"
$digit = 0-9     
-- digits 

tokens :-
$white+       ; -- for space 
  "--".*        ; -- * means anything after that is comment
  $digit+       { \s -> TokenInt (read s) } 
  duplicate0    {\d -> TokenDuplicate0 }
  duplicate1    {\d -> TokenDuplicate1 }
  newline       {\d -> TokenNewLine}
  end           {\d -> TokenEnd}
  
{ 
-- Each action has type :: AlexPosn -> String -> Token 

-- The token type: 
data Token = 
  TokenInt Int    |
  TokenDuplicate0 | 
  TokenDuplicate1 | 
  TokenNewLine    | 
  TokenEnd                 
  deriving (Eq,Show) 

-- tokenPosn :: Token -> String
-- tokenPosn (TokenDuplicate (AlexPn a l c) _ _) = show(l) ++ ":" ++ show(c)
-- tokenPosn (TokenNewLine  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
-- tokenPosn (TokenEnd  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}