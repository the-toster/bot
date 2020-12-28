{-# LANGUAGE DuplicateRecordFields #-}
module Model.Message where

data TgMessage = TgMessage {chatId :: String, payload :: String } deriving Show

data VkMessage = VkMessage {chatId :: String, payload :: String } deriving Show
