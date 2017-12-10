module Main exposing (..)

import Html exposing (Html, text, div, h1, img, button)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model =
    {count:Int,str:Int}


init : ( Model, Cmd Msg )
init =
    ( {count = 0, str = 12 }, Cmd.none )



---- UPDATE ----



type Msg = Increment | Decrement | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ({ model | count = model.count + 1 + model.str }, Cmd.none )

        Decrement ->
            ({ model | count = model.count - 1 }, Cmd.none )
        _ ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.count) ]
    , button [ onClick Increment ] [ text "+" ]
    ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
