module Model.MessageHandler where

import Config.Settings
import Model.User
import Model.Message
import qualified LogRecord as Log
import Action

handle :: (Message m) => m -> Settings -> ([Action m], Settings)
handle m s | isHelpRequest m        = ([responseText m (helpMessageText s) ], s)
           | isSettingsRequest m    = ([SendMessage $ settingsMessage m (settingsMessageText s)], enableDialog s (getAuthor m))
           | isDialogActive s (getAuthor m) && isSettingsResponse m = let 
                s' = updateSettings m s 
                in ([logRepeatsSettingsUpdate m s', responseText m "OK"], s')
           | otherwise              = (repeatMessage m s, s)
    where
        repeatMessage m s = replicate (getRepeats s (getAuthor m)) (SendMessage $ echoMessage m) 
        logRepeatsSettingsUpdate m s = WriteLog $ Log.info ("Set repeats to " ++ show currentRepeats ++ " for " ++ show user) where
            currentRepeats = getRepeats s user
            user  = getAuthor m

responseText :: Message m => m -> String -> Action m
responseText m t = SendMessage $ textMessage m t

updateSettings :: (Message m) => m -> Settings -> Settings 
updateSettings m s = let 
        repeats = extractRepeats m
        author = getAuthor m
        in case repeats of
            Just n -> setRepeats s author n
            Nothing -> s