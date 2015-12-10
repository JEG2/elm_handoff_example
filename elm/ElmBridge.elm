module ElmBridge where

import Graphics.Element exposing (Element, show)


port data : List {name : String, expertise : String}


main : Element
main =
  show data
