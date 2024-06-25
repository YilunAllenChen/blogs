module Main exposing (main)

import Browser
import Components.Code exposing (autocode)
import Debug exposing (log)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { passage : String
    }


init : Model
init =
    { passage = """
        -- quick sort in haskell
        qs :: Ord a => [a] -> [a]
        qs [] = []
        qs (x:xs) = qs lower ++ [x] ++ qs higher
          where
            lower = filter (<= x)
            higher = filter (> x)
        """
    }


type Msg
    = NoOp
    | ChangeCodeSection String


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        ChangeCodeSection new_code ->
            Model new_code


view : Model -> Html Msg
view model =
    let
        _ =
            log model.passage ""
    in
    div [ class "p-4 bg-slate-100 h-screen" ]
        [ model.passage |> autocode ]
