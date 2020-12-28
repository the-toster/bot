module LogRecord (LogRecord, LogLevel) where

data LogLevel = Error | Warning | Info | Debug deriving Show
newtype Message = Message String deriving Show

data LogRecord = LogRecord LogLevel Message deriving Show