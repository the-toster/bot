module Model.MessageHandler where

import Config.Settings
import Model.User
import Model.Message
import qualified LogRecord as Log
import Action



handle :: (Message m) => m -> Settings -> ([Action m], Settings)
handle m s | isHelpRequest m        = ([SendMessage $ Model.Message.helpMessage m s], s)
           | isSettingsRequest m    = ([SendMessage $ settingsMessage m s], s)
           | isSettingsResponse m s = let s' = updateSettings m s in ([logRepeatsSettingsUpdate m s'], s')
           | otherwise              = (repeatMessage m s, s)
    where
        repeatMessage m s = replicate (getRepeats s (getAuthor m)) (SendMessage $ echoMessage m) 
        logRepeatsSettingsUpdate m s = WriteLog $ Log.info ("Set repeats to " ++ show currentRepeats ++ " for " ++ show user) where
            currentRepeats = getRepeats s user
            user  = getAuthor m