module Settings where
import qualified Data.Map as Map
import Model.User

data Settings = Settings {defaultRepeatsNumber :: Int, repeats :: Map.Map User Int}
