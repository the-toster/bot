module Config.UserSettings where

data UserSettings = UserSettings {repeats :: Int, isDialogActive :: Bool } deriving (Show, Eq)

initiate :: Int -> UserSettings
initiate n = UserSettings n False

enableDialog s = s {isDialogActive = True}
disableDialog s = s {isDialogActive = False}

setRepeats s n = s {repeats = n}
