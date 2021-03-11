module Pages.Top exposing (Model, Msg, Params, page)

import Element exposing (..)
import Element.Font as Font
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)


type alias Params =
    ()


type alias Model =
    Url Params


type alias Msg =
    Never


page : Page Params Model Msg
page =
    Page.static
        { view = view
        }



-- VIEW


view : Url Params -> Document Msg
view { params } =
    { title = "Homepage"
    , body = [ 
        row [centerX, paddingXY 16 128, spacing 24, alignRight] 
        [
            column [spacing 14]
            [
              el [centerX, Font.size 48, Font.semiBold, alignRight] (text "hello gooby")
            , el [alpha 0.5] (text "that's what I say")
            ]
        ]
        , text "Homepage" 
    ]
    }
