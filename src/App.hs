{-# LANGUAGE OverloadedStrings #-}

module App (run) where

import Network.Wai (responseLBS, Application)
import qualified Network.Wai.Handler.Warp as Warp
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)

app :: Application
app req f =
    f $ responseLBS status200 [(hContentType, "text/plain")] "Hello, world!"

run :: Warp.Port -> IO ()
run port = Warp.run port app
