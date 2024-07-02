{-# LANGUAGE OverloadedStrings #-}

module Main where

import CMark

import System.Environment
import System.Exit

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

dotHTML :: String -> String
dotHTML name = name ++ ".html"

writeFileContent :: (String, T.Text) -> IO ()
writeFileContent (name, cont) = TIO.writeFile name cont

fileToHTML :: (String, T.Text) -> (String, T.Text)
fileToHTML (name, cont) = (dotHTML name, commonmarkToHtml [optSmart] cont)

fatal :: IO ()
fatal = exitWith (ExitFailure 1)

usage :: IO ()
usage = TIO.putStrLn "Usage: portfolio [-h] [file ..]"

removeMdExtension :: String -> String
removeMdExtension [] = ""
removeMdExtension (c:cs) | c == '.' = ""
                         | otherwise = [c] ++ removeMdExtension cs

parse :: [String] -> IO (String, T.Text)
parse [] = usage >> fatal >> return ("", T.empty)

parse (file : _) = do
	cont <- TIO.readFile file
	return (removeMdExtension file, cont)

main :: IO ()
main = getArgs >>= parse >>= writeFileContent . fileToHTML

