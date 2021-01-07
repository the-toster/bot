import Test.Hspec
import Model.MessageHandler
import Model.Message
import Config.Settings
import Tg.Message
import Model.User
import Action

main :: IO ()
main =  hspec $ do
  describe "handle basic message" $ do
    let inpMes = inputMessage "body"
    let echoMes = echoMessage inpMes
    it "returns 2 echo messages on basic input" $
      fst (handle inpMes settings) `shouldBe` [SendMessage echoMes, SendMessage echoMes] 

  describe "handle help message" $ do
    let inpMes = inputMessage "/help"
    it "should return help message" $
      fst (handle inpMes settings) `shouldBe` [SendMessage (Model.Message.helpMessage inpMes settings)]

  describe "handle settings message" $ do
    let inpMes = inputMessage "/repeats"
    it "should return settings dialog" $
      fst (handle inpMes settings) `shouldBe` [SendMessage (Model.Message.settingsMessage inpMes settings)]
    it "should change user state" $
      snd (handle inpMes settings) `shouldBe` (initialSettings 2 "todo: settings type 123")
    

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
