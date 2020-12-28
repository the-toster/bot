module Model.User where


data User = TgUser String | VkUser String deriving (Eq, Ord)