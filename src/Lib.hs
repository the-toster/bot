module Lib
    (
        someFunc,
        Action(name)
    ) where

import Settings
import Input
import Action


someFunc :: Settings -> Input -> ([Action], Settings)
someFunc settings input = ([Action "wer", Action "spot"], settings)
