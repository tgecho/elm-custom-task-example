module Counter exposing (Model, Msg, init, update, view)

-- where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Number
import Task


-- MODEL


type alias Model =
    Int


init : Int -> Model
init count =
    count



-- UPDATE


type Msg
    = RequestIncrement
    | Increment Int
    | RequestDecrement
    | Decrement Int
    | NaN String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RequestIncrement ->
            ( model, Task.perform NaN Increment (Number.getNumber 1) )

        Increment number ->
            ( model + number, Cmd.none )

        RequestDecrement ->
            ( model, Task.perform NaN Decrement (Number.getNumber 1) )

        Decrement number ->
            ( model - 1, Cmd.none )

        NaN message ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick RequestDecrement ] [ text "-" ]
        , div [ countStyle ] [ text (toString model) ]
        , button [ onClick RequestIncrement ] [ text "+" ]
        ]


countStyle : Attribute msg
countStyle =
    style
        [ ( "font-size", "20px" )
        , ( "font-family", "monospace" )
        , ( "display", "inline-block" )
        , ( "width", "50px" )
        , ( "text-align", "center" )
        ]
