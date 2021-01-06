module Action where

import qualified LogRecord as Log

data Action m = SendMessage m | WriteLog Log.Record deriving (Eq, Show)