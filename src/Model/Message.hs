module Model.Message where

import Config.Settings
import Model.User

class Message m where
    isHelpRequest       :: m -> Bool 
    isSettingsRequest   :: m -> Bool 
    isSettingsResponse  :: m -> Settings -> Bool
    updateSettings      :: m -> Settings -> Settings

    helpMessage         :: m -> Settings -> m
    settingsMessage     :: m -> Settings -> m
    echoMessage         :: m -> m
    
    getAuthor           :: m -> User