module Config.Settings (
        initialSettings,
        Settings(),
        getRepeats,
        setRepeats,
        helpMessage
        ) where
import qualified Data.Map as Map
import Model.User

data Settings = Settings {
        defaultRepeatsNumber :: Int,
        usersSettings :: Map.Map User UserSettings,
        helpMessage :: String 
        } deriving (Show, Eq)
data UserSettings = UserSettings {repeats :: Int, isRepeatsDialogActive :: Bool } deriving (Show, Eq)

initialSettings :: Int -> String -> Settings
initialSettings n s = Settings n Map.empty s

getUserSettings :: Settings -> User -> UserSettings
getUserSettings s u = case Map.lookup u (usersSettings s) of
        Just settings -> settings
        Nothing -> UserSettings (defaultRepeatsNumber s) False 

getRepeats :: Settings -> User -> Int
getRepeats s u = repeats $ getUserSettings s u

setRepeats :: Settings -> User -> Int -> Settings
setRepeats s u n = Settings defaultRepeats usersSettings' (helpMessage s) where 
        defaultRepeats = defaultRepeatsNumber s
        usersSettings'  = Map.insert u (UserSettings n False) (usersSettings s) 