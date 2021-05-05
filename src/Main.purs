module Main where

import Prelude
import Effect (Effect)

import Specular.Dom.Browser ((:=))
import Specular.Dom.Element (attrs, class_,  el,  onClick_, text, dynText)
import Specular.Dom.Widget (runMainWidgetInBody)
import Specular.Ref (Ref)
import Specular.Ref as Ref



main :: Effect Unit
main = do
  -- | Will append widget to the body
  runMainWidgetInBody do
    counter :: Ref Int <- Ref.new 0
    -- | Subtract 1 from counter value
    let subtractCb = Ref.modify counter (add (negate 1))

    -- | Add 1 to counter value
    let addCb = Ref.modify counter (add 1)

    el "button" [class_ "btn", attrs ("type":="button" ), onClick_ addCb ] do
      text "+"

    dynText $ show <$> Ref.value counter

    el "button" [class_ "btn", attrs ("type":="button" ), onClick_ subtractCb ] do
      text "-"
