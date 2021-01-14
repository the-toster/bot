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
      fst (handle inpMes settings) `shouldBe` [SendMessage (Model.Message.helpMessage inpMes "Hi, say /repeats to set repeats number")]

  describe "handle settings message" $ do
    let inpMes = inputMessage "/repeats"
    it "should return settings dialog" $
      fst (handle inpMes settings) `shouldBe` [SendMessage (Model.Message.settingsMessage inpMes "Select repeats number")]
    it "should change user state" $
      snd (handle inpMes settings) `shouldBe` enableDialog settings (getAuthor inpMes)
    

settings :: Settings
settings = initiateSettings 2 "Hi, say /repeats to set repeats number" "Select repeats number"


inputMessage :: String -> TgMessage
inputMessage body = TgMessage {
    messageId = Just "messageID",
    from = TgUser "author",
    to = TgUser "bot",
    body = body,
    copyOf = Nothing
    }
