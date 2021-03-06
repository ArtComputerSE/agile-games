module Page.FacilitatorPage exposing (viewFacilitatorPage)

import Bootstrap.Button as Button
import Bootstrap.ButtonGroup as ButtonGroup
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, div, h1, h2, text)
import Html.Attributes exposing (class, style)
import Message exposing (GamePhase(..), GameState)
import Model exposing (GameSessionCode, Model, gameSessionId2String)
import Msg exposing (Msg(..))
import Page.Common exposing (boardView, playerList, reportingTable)


viewFacilitatorPage : Model -> Html Msg
viewFacilitatorPage model =
    Grid.container []
        [ Grid.row []
            [ Grid.col [ Col.sm ]
                [ viewHeadLine model.gameSessionCode
                ]
            , playerList model.gameState.players
            ]
        , Grid.row []
            [ Grid.col []
                [ phaseRow model.gameState
                , reportingTable model.gameState.players
                , boardView model.gameState.board ( -1, -1 )
                ]
            ]
        ]


viewHeadLine : GameSessionCode String -> Html Msg
viewHeadLine gameSessionID =
    div
        [ class "jumbotron"
        , style "text-align" "center"
        , style "background-image" "url(https://www.crisp.se/wp-content/themes/crisp/images/crisp-logo-smaller-20171009.png)"
        , style "background-repeat" "no-repeat"
        ]
        [ h1 [] [ text "Facilitator" ]
        , h2 [] [ text <| "Game code: " ++ gameSessionId2String gameSessionID ]
        , Button.button [ Button.outlineDanger, Button.onClick Leave ] [ text "Leave" ]
        ]


phaseRow : GameState -> Html Msg
phaseRow gameState =
    Grid.row []
        [ Grid.col [ Col.sm8 ]
            [ ButtonGroup.buttonGroup []
                [ bGroup gameState Gathering "Gathering"
                , bGroup gameState Estimation "Estimation"
                , bGroup gameState Executing "Executing"
                , bGroup gameState Reporting "Reporting"
                ]
            ]
        ]


bGroup : GameState -> GamePhase -> String -> ButtonGroup.ButtonItem Msg
bGroup gameState phase label =
    if gameState.phase == phase then
        ButtonGroup.button [ Button.primary ] [ text label ]

    else
        ButtonGroup.button [ Button.outlinePrimary, Button.onClick <| GotoPhase phase ] [ text label ]
