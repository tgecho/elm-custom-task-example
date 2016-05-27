module Ffi exposing (promise)

-- where

import Native.Ffi
import Task


promise : a -> b -> Task.Task x c
promise name arg =
    Native.Ffi.promise name arg
