{ 
module Tokens where 
}

%wrapper "basic"

$digit = 0-9     
-- digits 

tokens :-
$white+       ; -- for space 
  "--".*        ; -- * means anything after that is comment
  duplicate     {(\d -> TokenDuplicate d)}
  newline       {(\d -> TokenNewLine)}
  end           {(\d -> TokenEnd)}

{ 
-- Each action has type :: AlexPosn -> String -> Token 

-- The token type: 
data Token = 
  TokenDuplicate Int Int   | 
  TokenNewLine             | 
  TokenEnd                 
  deriving (Eq,Show) 

-- tokenPosn :: Token -> String
-- tokenPosn (TokenDuplicate (AlexPn a l c) _ _) = show(l) ++ ":" ++ show(c)
-- tokenPosn (TokenNewLine  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
-- tokenPosn (TokenEnd  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

main = do
  s <- getContents
  print(alexScanTokens s)

}