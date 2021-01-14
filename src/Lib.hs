module Lib
    (
        innerMain
    ) where

import Config.Settings
import qualified Input
import Model.Message 
import Tg.Message 
import Model.User

import Action
import Model.MessageHandler


innerMain :: IO ()
innerMain = do
    let (actions, settings) = handle someMessage (initiateSettings 1 "Hi, say /repeats to set repeats number" "Select repeats number")
    mapM_ print actions


someMessage :: TgMessage
someMessage = TgMessage
                    (Just "123") 
                    (TgUser "123") 
                    (TgUser "321")
                    "Body"
                    Nothing 
