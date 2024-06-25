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
        pub fn main() {
            days.iter()
                .map(|d| d.spend(Activity.Coding))
                .map(|c| c.extract_fun())
                .collect();
        }
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
        [ div [ class "text-xl text-center m-2" ] [ text "Hey! Allen here. I haven't started on the blogs yet." ]
        , div [ class "text-base text-slate-500 text-center m-4" ] [ text "For no reason at all, here's some rust." ]
        , model.passage
            |> autocode
        ]
