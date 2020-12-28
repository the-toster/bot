module Config.Config where

newtype TgToken = TgToken String
newtype VkToken = VkToken String

data Config = Config {tgToken :: TgToken, vkToken :: VkToken, defaultRepeats :: Int, helpMessage :: String}
