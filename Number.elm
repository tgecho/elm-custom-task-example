module Number exposing (..)

import Ffi


getNumber number =
    Ffi.promise "getNumber" 1
