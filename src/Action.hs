module Action where


import LogRecord

data Action = SendHttpRequest | WriteLog LogRecord deriving Show