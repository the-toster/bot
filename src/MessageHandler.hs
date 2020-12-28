module MessageHandler where

import Settings
import Model.User

class Message m where
    isHelpRequest :: m -> Bool 
    isSettingsRequest :: m -> Bool 
    isSettingsResponse :: m -> Settings -> Bool
    updateSettings :: m -> Settings -> Settings
    getAuthor :: m -> User

data Action = SendEchoMessage | SendHelpMessage | SendSettings | WriteLog 


handle :: (Message m) => m -> Settings -> ([Action], Settings)
handle m s | isHelpRequest m = ([SendHelpMessage], s)
           | isSettingsRequest m = ([SendHelpMessage], s)
           | isSettingsResponse m s = ([WriteLog], updateSettings m s)
           | otherwise = (replicate (getRepeats s (getAuthor m)) SendEchoMessage, s)