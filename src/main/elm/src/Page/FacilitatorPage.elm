module Page.FacilitatorPage exposing (viewFacilitatorPage)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, div, h1, h2, text)
import Html.Attributes exposing (class, style)
import Model exposing (GameSessionId, Model, gameSessionId2String)
import Msg exposing (Msg(..))
import Page.Common exposing (playerList)


viewFacilitatorPage : Model -> Html Msg
viewFacilitatorPage model =
    Grid.container []
        [ Grid.row []
            [ Grid.col [ Col.sm ]
                [ viewHeadLine model.gameSessionId
                ]
            , playerList model.gameState.players
            ]
        ]


viewHeadLine : GameSessionId String -> Html Msg
viewHeadLine gameSessionID =
    div [ class "jumbotron", style "text-align" "center" ]
        [ h1 [] [ text "Facilitator" ]
        , h2 [] [ text <| "Game code: " ++ gameSessionId2String gameSessionID ]
        ]