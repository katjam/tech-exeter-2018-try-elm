module Main exposing (..)

import Html exposing (Html, button, div, h1, h2, li, text, ul)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    { bricks : Int }


model : Model
model =
    { bricks = 0 }



-- UPDATE


type Msg
    = AddOne
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddOne ->
            { model | bricks = model.bricks + 1 }

        Reset ->
            { model | bricks = 0 }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [ style [ ( "padding-left", "2em" ) ] ]
            [ h1 [] [ text "Hello Exeter!" ]
            , h2 [] [ text "Let's count some bricks." ]
            , div [] [ text (toString model.bricks) ]
            , button [ onClick AddOne ] [ text "One more!" ]
            , button [ onClick Reset ] [ text "reset" ]
            ]
        ]


main =
    Html.beginnerProgram { model = model, view = view, update = update }
