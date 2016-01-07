module ElmBridge where

import Graphics.Element exposing (Element, show)

import Http
import Json.Decode as Json exposing ((:=))
import Task exposing (..)
import Signal exposing (Mailbox)
import Graphics.Input exposing(button)
import Graphics.Element exposing(flow,down,empty)


lookupZipCode : String -> Task Http.Error (List String)
lookupZipCode query =
    Http.get places ("http://api.zippopotam.us/us/" ++ query)


places : Json.Decoder (List String)
places =
  let place =
        Json.object2 (\city state -> city ++ ", " ++ state)
          ("place name" := Json.string)
          ("state" := Json.string)
  in
      "places" := Json.list place


outBox : Mailbox ( Task Http.Error (List String) )
outBox = Signal.mailbox ( Task.succeed [ ] )


inBox : Mailbox ( List String )
inBox = Signal.mailbox [ ]


port requests : Signal ( Task Http.Error () )
port requests = Signal.map (flip Task.andThen (Signal.send inBox.address)) outBox.signal


view : List String -> Element -> Element
view response previous =
  flow down [ show response
            , button (Signal.message outBox.address (lookupZipCode "73162")) "Do Request"
            ]


main : Signal Element
main = Signal.foldp view (view [ ] empty) inBox.signal
