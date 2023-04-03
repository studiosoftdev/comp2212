{ 
module MDLTokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 

tokens :-
$white+       ; -- for space 
  "--".*        ; -- * means anything after that is comment
  duplicate     {(\d n -> TokenDuplicate d n)}
  newline       {(\d n -> TokenNewLine d)}
  end           {(\d n -> TokenEnd d)}

{ 
-- Each action has type :: AlexPosn -> String -> Token 

-- The token type: 
data Token = 
  TokenDuplicate AlexPosn Int Int   | 
  TokenNewLine  AlexPosn            | 
  TokenEnd AlexPosn                 |
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenDuplicate (AlexPn a l c) _ _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNewLine  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEnd  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}