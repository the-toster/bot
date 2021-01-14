module Config.Settings where

import Config.UserSettings as UserSettings
import qualified Data.Map as Map
import Model.User (User)

data Settings = Settings
  { defaultRepeatsNumber :: Int,
    usersSettings :: Map.Map User UserSettings,
    helpMessageText :: String,
    settingsMessageText :: String
  }
  deriving (Show, Eq)

initiateSettings :: Int -> String -> String -> Settings
initiateSettings n helpText settingsText =
  Settings { defaultRepeatsNumber = n,
      usersSettings = Map.empty,
      helpMessageText = helpText,
      settingsMessageText = settingsText
    }

getUserSettings :: Settings -> User -> UserSettings
getUserSettings s u = case Map.lookup u (usersSettings s) of
  Just settings -> settings
  Nothing -> initiate $ defaultRepeatsNumber s

setUserSettings :: Settings -> User -> UserSettings -> Settings
setUserSettings s u us = s {usersSettings = Map.insert u us (usersSettings s)}

getRepeats :: Settings -> User -> Int
getRepeats s u = repeats $ getUserSettings s u

setRepeats :: Settings -> User -> Int -> Settings
setRepeats s u n = setUserSettings s u $ UserSettings.setRepeats (getUserSettings s u) n

isDialogActive :: Settings -> User -> Bool
isDialogActive s u = UserSettings.isDialogActive $ getUserSettings s u

enableDialog :: Settings -> User -> Settings
enableDialog s u = setUserSettings s u $ UserSettings.enableDialog $ getUserSettings s u

disableDialog :: Settings -> User -> Settings
disableDialog s u = setUserSettings s u $ UserSettings.disableDialog $ getUserSettings s u