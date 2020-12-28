{-# LANGUAGE InstanceSigs #-}
module Tg.Message where
import Model.Message
import Model.User
import Config.Settings
import Text.Read (readMaybe)

data TgMessage = TgMessage {
        messageId :: Maybe String,
        from :: User,
        to :: User,
        body :: String,
        copyOf :: Maybe String
        } deriving Show

instance Message TgMessage where
    isHelpRequest       :: TgMessage -> Bool
    isHelpRequest m = body m == "/help"

    isSettingsRequest   :: TgMessage -> Bool 
    isSettingsRequest m = body m == "/repeats"

    isSettingsResponse  :: TgMessage -> Settings -> Bool
    isSettingsResponse m s = body m == "4"

    updateSettings      :: TgMessage -> Settings -> Settings
    updateSettings m s = case (readMaybe (body m) :: Maybe Int) of 
        Just a -> setRepeats s (getAuthor m) a
        Nothing -> s

    helpMessage         :: TgMessage -> Settings -> TgMessage
    helpMessage m s = TgMessage Nothing (to m) (from m) (Config.Settings.helpMessage s) Nothing

    settingsMessage     :: TgMessage -> Settings -> TgMessage
    settingsMessage m s = TgMessage Nothing (to m) (from m) "set repeats number" Nothing

    echoMessage         :: TgMessage -> TgMessage
    echoMessage m = TgMessage Nothing (to m) (from m) "" (messageId m)

    getAuthor           :: TgMessage -> User
    getAuthor = from