module Main where

import System.Environment
import System.Exit

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import Markdown (fileToHTML)
import ArgumentParser (parse)

writeFileContent :: (String, T.Text) -> IO ()
writeFileContent (name, cont) = TIO.writeFile name cont

main :: IO ()
main = getArgs >>= parse >>= writeFileContent . fileToHTML

