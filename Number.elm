module Number exposing (getNumber)

-- where

import Native.Number
import Task


getNumber : Int -> Task.Task x a
getNumber number =
    Native.Number.getNumber number
