{-# LANGUAGE OverloadedStrings #-}

module ArgumentParser where

import System.Exit

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import FileType

fatal :: IO ()
fatal = exitWith (ExitFailure 1)

usage :: IO ()
usage = TIO.putStrLn "Usage: portfolio [-h] [file ..]"

removeMdExtension :: String -> String
removeMdExtension [] = ""
removeMdExtension (c:cs) | c == '.' = ""
                         | otherwise = [c] ++ removeMdExtension cs

parse :: [String] -> IO File
parse [] = usage >> fatal >> return ("", T.empty)

parse (file : _) = do
	cont <- TIO.readFile file
	return (removeMdExtension file, cont)


