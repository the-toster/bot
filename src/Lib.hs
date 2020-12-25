module Lib
    (
        someFunc,
        Config(Config),
        Settings(Settings),
        Input(Input),
        Action(name)
    ) where

import qualified Data.Map as Map

data Config = Config {tgToken :: String}
data Settings = Settings {repeatsTg :: Map.Map String Int}
data Input = Input {sender :: String, message :: String}
data Action = Action {name :: String}

someFunc :: Config -> Settings -> Input -> ([Action], Settings)
someFunc cfg settings input = ([Action "wer", Action "spot"], settings)
