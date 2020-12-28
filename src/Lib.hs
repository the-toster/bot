module Lib
    (
        innerMain
    ) where

import Settings
import qualified Input as Input
import Model.Message 
import Action


innerMain :: IO ()
innerMain = do
    let (actions, settings) = someFunc (initialSettings 1) Input.TgMessage
    mapM_ print actions

someFunc :: Settings -> Input.Input -> ([Action], Settings)
someFunc settings input = ([SendHttpRequest, WriteLog LogRecord ], settings)
