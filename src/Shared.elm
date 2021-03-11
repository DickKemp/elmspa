module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation exposing (Key)
import Element exposing (..)
import Element.Font as Font
import Spa.Document exposing (Document)
import Spa.Generated.Route as Route
import Url exposing (Url)



-- INIT


type alias Flags =
    ()


type alias Model =
    { url : Url
    , key : Key
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model url key
    , Cmd.none
    )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view :
    { page : Document msg, toMsg : Msg -> msg }
    -> Model
    -> Document msg
view { page, toMsg } model =
    { title = page.title
    , body =
        [ column [ padding 20
                 , spacing 20
                 , height fill 
                 , width fill
                 , Font.family 
                    [ Font.external { url = "https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600", 
                    name="Source Sans Pro"}]
                 ]
            [ row [ spacing 20, centerX ]
                [ link [ Font.size 32, Font.color (rgb 0 0.25 0.5), Font.underline ] { url = Route.toString Route.Top, label = text "Elm-spa" }
                , link [ Font.size 16, Font.color (rgb 0 0.25 0.5), Font.underline ] { url = Route.toString Route.Docs, label = text "Docs" }
                , link [ Font.size 16, Font.color (rgb 0 0.25 0.5), Font.underline ] { url = Route.toString Route.NotFound, label = text "Not found" }
                ]
            , column [ height fill ] page.body
            ]
        ]
    }
