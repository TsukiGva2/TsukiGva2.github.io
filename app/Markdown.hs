module Markdown where

import CMark

import qualified Data.Text as T

dotHTML :: String -> String
dotHTML name = name ++ ".html"

markToHTML :: T.Text -> T.Text
markToHTML md = commonmarkToHtml [optSmart] md

fileToHTML :: (String, T.Text) -> (String, T.Text)
fileToHTML (name, cont) = (dotHTML name, markToHTML cont)

