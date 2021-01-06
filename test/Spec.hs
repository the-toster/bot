import Test.Hspec
import Model.MessageHandler
import Config.Settings
import Tg.Message
import Model.User
import Action

main :: IO ()
main =  hspec $ do
  describe "handle" $ do
    it "returns 2 echo messages on basic input" $
      head (fst (handle someMessage settings)) `shouldBe` SendMessage TgMessage 

settings :: Settings
settings = initialSettings 2 "Hi, say /repeats to set repeats number"

someMessage :: TgMessage
someMessage = TgMessage
                    (Just "123")
                    (TgUser "123")
                    (TgUser "321")
                    "Body"
                    Nothing
