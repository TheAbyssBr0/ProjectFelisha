import os
import illwill
include flashCardStack
include stringUtils

proc exitProc() {.noconv.} =
  illwillDeinit()
  showCursor()
  quit(0)

proc print_flashcard(flashCards: FlashCardStack, width: int,
    height: int, tb: var TerminalBuffer, x:int, y:int) =
  let flashCardString:string = flashCards.getContent

  tb.clear
  tb.drawRect(x, y, x + width, y + height)

  var char_index_tracker = 0
  for column_counter in 0..height - 2:
    let substr_info: (string, int) = flashCardString[char_index_tracker..^1]
      .get_substring(width - 3)
    tb.write(x + 2, y + column_counter + 1, substr_info[0])
    if substr_info[1] == 0:
      break
    char_index_tracker += substr_info[1]

  tb.display

# main
if paramCount() != 1:
  echo "Usage: $ appname file_with_flash_cards"
  echo paramCount()
  quit(1)

let
  width: int = 60
  height: int = 16

let flashCardStr = readFlashCardFile(paramStr(1))
var flashCards: FlashCardStack = flashCardStr.initFlashCards

illwillInit(fullscreen=true)
setControlCHook(exitProc)
hideCursor()

var tb: TerminalBuffer = newTerminalBuffer(terminalWidth(), terminalHeight())

let
  x: int = (tb.width - width) div 2
  y: int = (tb.height - height) div 2

if x < width or y < height:
  echo "Terminal too small for flashcards"
  quit(1)

print_flashcard(flashCards, width, height, tb, x, y)

while true:
  var key: Key = getKey()
  case key
  of Key.None: discard
  of Key.Right:
    flashCards.nextCard
    flashCards.print_flashcard(width, height, tb, x, y)
  of Key.Left:
    flashCards.prevCard
    flashCards.print_flashcard(width, height, tb, x, y)
  of Key.Q: exitProc()
  else: discard
  sleep(20)
