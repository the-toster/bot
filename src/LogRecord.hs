module LogRecord where

data Level = Error | Warning | Info | Debug deriving (Eq, Ord, Show)
newtype Message = Message String deriving Show

data Record = Record Level Message deriving Show

logRecord :: Level -> String -> Record
logRecord l s = Record l (Message s)

error :: String -> Record
error = logRecord Error

warning :: String -> Record
warning = logRecord Warning


info :: String -> Record
info = logRecord Info


debug :: String -> Record
debug = logRecord Debug
