import std/strutils
import std/sequtils
import std/random

type FlashCardStack = object
  flashCardList: seq[string]
  flashCardNum: int

proc readFlashCardFile(filename: string): string =
  var flashCards: string
  try:
    flashCards = readFile(filename)
  except:
    echo "Invalid file name. Exiting"
    quit(1)

  if flashCards.len == 0:
    echo "Input file is empty. Exiting"
    quit(1)

  return flashCards

proc initFlashCards(flashCardStr: string): FlashCardStack =
  # filter out empty cards
  var flashCardList: seq[string] = 
    filter(splitLines(flashCardStr), proc (x: string): bool = x != "")

  randomize()
  shuffle(flashCardList)
  return FlashCardStack(flashCardList: flashCardList, flashCardNum: 0)

func getContent(flashStack: FlashCardStack): string =
  return flashStack.flashCardList[flashStack.flashCardNum]

proc nextCard(flashStack: var FlashCardStack) =
  if flashStack.flashCardNum < (flashStack.flashCardList.len - 1):
    flashStack.flashCardNum += 1

proc prevCard(flashStack: var FlashCardStack) =
  if flashStack.flashCardNum != 0:
    flashStack.flashCardNum -= 1