{-# LANGUAGE OverloadedStrings #-}

module Main where

import CMark

import System.Environment
import System.Exit

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

toHTML :: T.Text -> T.Text
toHTML str = commonmarkToHtml [optSmart] str

parse :: [String] -> IO T.Text
parse [] = usage >> fatal >> return T.empty
parse fs = T.concat <$> mapM TIO.readFile fs

fatal :: IO ()
fatal = exitWith (ExitFailure 1)

usage :: IO ()
usage = TIO.putStrLn "Usage: portfolio [-h] [file ..]"

main :: IO ()
main = getArgs >>= parse >>= TIO.writeFile "out.html" . toHTML

