module Main exposing (..)

--where

import Counter
import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)


main : Program Never
main =
    App.program
        { init = ( init 0 0, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \m -> Sub.none
        }



-- MODEL


type alias Model =
    { topCounter : Counter.Model
    , bottomCounter : Counter.Model
    }


init : Int -> Int -> Model
init top bottom =
    { topCounter = Counter.init top
    , bottomCounter = Counter.init bottom
    }



-- UPDATE


type Msg
    = Reset
    | Top Counter.Msg
    | Bottom Counter.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case Debug.log "message" message of
        Reset ->
            ( init 0 0, Cmd.none )

        Top msg ->
            let
                ( topCounter, topCmd ) =
                    Counter.update msg model.topCounter
            in
                ( { model | topCounter = topCounter }, Cmd.map Top topCmd )

        Bottom msg ->
            let
                ( bottomCounter, bottomCmd ) =
                    Counter.update msg model.bottomCounter
            in
                ( { model | bottomCounter = bottomCounter }, Cmd.map Bottom bottomCmd )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ App.map Top (Counter.view model.topCounter)
        , App.map Bottom (Counter.view model.bottomCounter)
        , button [ onClick Reset ] [ text "RESET" ]
        ]
