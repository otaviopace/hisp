module Tokenize
    ( tokenize
    ) where

-- adapted from: http://bluebones.net/2007/01/replace-in-haskell/
replace :: Eq a => [a] -> [a] -> [a] -> [a]
replace _ _ [] = []
replace find repl s =
    if take (length find) s == find
        then repl ++ replace find repl (drop (length find) s)
        else head s : replace find repl (tail s)

tokenize :: String -> [String]
tokenize = words . replace "(" " ( " . replace ")" " ) "
