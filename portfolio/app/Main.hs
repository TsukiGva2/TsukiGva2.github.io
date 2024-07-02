{-# LANGUAGE OverloadedStrings #-}

module Main where

import CMark
import Data.Text ()

main :: IO()
main = putStrLn . decodeUtf8 . encode $ commonmarkToHtml [optSmart] "Hello, Haskell!"
