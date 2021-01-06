import Test.Hspec
import Model.MessageHandler
import Config.Settings
import Tg.Message
import Model.User
import Action

main :: IO ()
main =  hspec $ do
  describe "handle" $ do
    let inpMes = inputMessage "body"
    let echoMes = echoMessage inpMes
    it "returns 2 echo messages on basic input" $
      fst (handle inpMes settings) `shouldBe` [SendMessage echoMes, SendMessage echoMes] 

settings :: Settings
settings = initialSettings 2 "Hi, say /repeats to set repeats number"


inputMessage :: String -> TgMessage
inputMessage body = TgMessage {
    messageId = Just "messageID",
    from = TgUser "author",
    to = TgUser "bot",
    body = body,
    copyOf = Nothing
    }

echoMessage :: TgMessage -> TgMessage
echoMessage mes = TgMessage {
    messageId = Nothing,
    from = to mes,
    to = from mes,
    body = body mes,
    copyOf = messageId mes
    }

                  