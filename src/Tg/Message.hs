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
        } deriving (Show, Eq)

instance Message TgMessage where
    isHelpRequest       :: TgMessage -> Bool
    isHelpRequest m = body m == "/help"

    isSettingsRequest   :: TgMessage -> Bool 
    isSettingsRequest m = body m == "/repeats"

    isSettingsResponse  :: TgMessage -> Bool
    isSettingsResponse m = body m == "4"

    extractRepeats      :: TgMessage -> Maybe Int
    extractRepeats m = readMaybe (body m)

    helpMessage         :: TgMessage -> String -> TgMessage
    helpMessage m text = TgMessage Nothing (to m) (from m) text Nothing

    settingsMessage     :: TgMessage -> String -> TgMessage
    settingsMessage m text = TgMessage Nothing (to m) (from m) text Nothing

    echoMessage         :: TgMessage -> TgMessage
    echoMessage m = TgMessage Nothing (to m) (from m) "" (messageId m)

    getAuthor           :: TgMessage -> User
    getAuthor = from