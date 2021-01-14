module Model.Message where

import Config.Settings
import Model.User

class Message m where
    isHelpRequest       :: m -> Bool 
    isSettingsRequest   :: m -> Bool 
    isSettingsResponse  :: m -> Bool
    extractRepeats      :: m -> Maybe Int

    textMessage         :: m -> String -> m
    settingsMessage     :: m -> String -> m
    echoMessage         :: m -> m
    
    getAuthor           :: m -> User