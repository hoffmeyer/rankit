module Rankit
    ( rankit
    ) where

import Data.Function (on)

data Player = Player { pid :: Int, playerName :: String, points :: Int } deriving (Show, Eq, Ord)
data Match = Match { team1 :: [Int], score1 :: Int, team2 :: [Int], score2 :: Int } deriving (Show)
data EventData = EventData { eventId :: Int, body :: Event }

instance Show (EventData) where
  show = show . eventId

instance Eq (EventData) where
  (==) = (==) `on` eventId

data Event = PlayerCreated Player | MatchPlayed Match

type UnrankedList = [(Int, Player)]

events :: [EventData]
events =  [EventData 1 (PlayerCreated (Player 1 "TheHoff" 1000))
          ,EventData 2 (PlayerCreated (Player 2 "Flemming" 1000))
          ,EventData 3 (MatchPlayed (Match [1] 2 [2] 1))]

processEvents :: [Event] -> UnrankedList
processEvents events = foldl processEvent [] events

processEvent :: UnrankedList -> Event -> UnrankedList
processEvent list (PlayerCreated p) =  ((pid p),p):list
processEvent list (MatchPlayed m) = list -- todo implement scoring right


rankit :: IO ()
rankit = do
  putStrLn "Ranky - Scoring the elite"
  let rankedList = processEvents (map body events)
  putStrLn "Ranked list"
  print rankedList
