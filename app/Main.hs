{-# LANGUAGE OverloadedStrings #-}

module Main where
import qualified Data.Map as Map

import Lib

main :: IO ()
main = do
    let (actions, settings) = someFunc (Config "token") (Settings Map.empty) (Input "vasa" "Hi!")
    mapM_ (putStrLn . name) actions