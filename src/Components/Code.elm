module Components.Code exposing (autocode)

import Html exposing (Html, code, pre, text)
import Html.Attributes exposing (class)


autocode : String -> Html none
autocode str =
    pre [] [ code [ class "rounded" ] [ text str ] ]
