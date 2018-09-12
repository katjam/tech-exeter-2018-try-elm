module Main exposing (..)

import Color exposing (Color, blue, brown, red)
import Html exposing (Html, button, div, h1, h2, li, text, ul)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    { bricks : List Color }


model : Model
model =
    { bricks = [] }



-- UPDATE


type Msg
    = AddOne Color
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddOne colour ->
            { model | bricks = colour :: model.bricks }

        Reset ->
            { model | bricks = [] }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [ style [ ( "padding-left", "2em" ) ] ]
            [ h1 [] [ text "Hello Exeter!" ]
            , h2 [] [ text "Let's count some bricks." ]
            , button [ onClick (AddOne red) ] [ text "One more red!" ]
            , button [ onClick (AddOne blue) ] [ text "One more blue!" ]
            , button [ onClick (AddOne brown) ] [ text "One more brown!" ]
            , button [ onClick Reset ] [ text "reset" ]
            , div [] [ text (toString model.bricks) ]
            ]
        ]


main =
    Html.beginnerProgram { model = model, view = view, update = update }
