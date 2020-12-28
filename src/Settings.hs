module Settings (initialSettings, Settings(), getRepeats) where
import qualified Data.Map as Map
import Model.User

data Settings = Settings {defaultRepeatsNumber :: Int, usersSettings :: Map.Map User UserSettings}
data UserSettings = UserSettings {repeats :: Int, isRepeatsDialogActive :: Bool }

initialSettings :: Int -> Settings
initialSettings n = Settings n Map.empty

getUserSettings :: Settings -> User -> UserSettings
getUserSettings s u = case Map.lookup u (usersSettings s) of
        Just settings -> settings
        Nothing -> UserSettings (defaultRepeatsNumber s) False 

getRepeats :: Settings -> User -> Int
getRepeats s u = repeats $ getUserSettings s u