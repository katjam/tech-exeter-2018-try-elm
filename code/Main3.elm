module Main exposing (..)

import Html exposing (Html, button, div, h1, h2, li, text, ul)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)


-- MODEL


type Colour
    = StringColor String
    | RgbColor Int Int Int


type alias Model =
    { bricks : List Colour }


model : Model
model =
    { bricks = [] }



-- UPDATE


type Msg
    = AddOne Colour
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
            , button [ onClick (AddOne (StringColor "yellowgreen")) ] [ text "One more green!" ]
            , button [ onClick (AddOne (RgbColor 246 235 15)) ] [ text "One more yellow!" ]
            , button [ onClick (AddOne (RgbColor 158 44 145)) ] [ text "One more purple!" ]
            , button [ onClick Reset ] [ text "reset" ]
            , ul [ style [ ( "list-style", "none" ) ] ]
                (List.map makeBrick model.bricks)
            ]
        ]



-- Brick li


makeBrick : Colour -> Html Msg
makeBrick colour =
    li
        [ style
            [ ( "background-color", cssColor colour )
            , ( "height", "50px" )
            , ( "margin", "8px" )
            , ( "width", "160px" )
            ]
        ]
        []



-- Color to css


cssColor : Colour -> String
cssColor color =
    case color of
        RgbColor r g b ->
            "rgb(" ++ toString r ++ "," ++ toString g ++ "," ++ toString b ++ ")"

        StringColor colorString ->
            colorString


main =
    Html.beginnerProgram { model = model, view = view, update = update }
