# ProjectFelisha
A cross-platform flashcard TUI application written in Nim! The flash cards are shuffled every time you open it.

## How to Use:
 - Download one of the binaries. Or compile yourself (instructions below)
 - execute the binary with a text file containing your stack of flashcards as an argument


Unix: ` $ ./executable_name flashcard_stack.txt`

Windows cmd: ` $ executable_name.exe flashcard_stack.txt`
 - Right arrow and Left arrow to navigate through your flash cards. Q to Quit.

#### Format of the text file containing your stack of flashcards:
It should contain each flash card on a separate line. So one flash card per line and as much white-space in between as you want.
For example: this file used in testing contains 4 flash cards ![image](https://github.com/TheAbyssBr0/ProjectFelisha/assets/63530018/7fda0dba-9ad8-42e2-9dfc-1c19782ffbd6) 

| flashcard 3 | flashcard 2 | flashcard 1 | flashcard 4 |
| ----------- | ----------- | ----------- | ----------- |
|![image](https://github.com/TheAbyssBr0/ProjectFelisha/assets/63530018/5895a8a0-2390-4207-8dbe-282711786df4)|![image](https://github.com/TheAbyssBr0/ProjectFelisha/assets/63530018/386d2fec-7afe-4c84-a0e4-e3590aec0235)|![image](https://github.com/TheAbyssBr0/ProjectFelisha/assets/63530018/639569a9-db34-46a4-900e-b8324504c06e)|![image](https://github.com/TheAbyssBr0/ProjectFelisha/assets/63530018/13d03839-253d-40f5-b242-384b9bca269b)|

#### Recommendations for text file containing flashcards:
 - I recommend an empty folder to keep the executable for this application and all your text files containing your stacks of flashcards
 - I recommend having a seperate text file for every subject. Different stacks for different topics perhaps?
 - There is a limit to the number of characters (default: 840 if you're unlucky, 855 if you're super lucky) so try to keep each card minimal and concise. If you want bigger flashcards, you can play with the width and height constants in main.nim


## How to compile
Get the prerequisites:
 - [Nim](https://nim-lang.org/install.html)
 - [illwill by johnnovak](https://github.com/johnnovak/illwill)
 - git

Clone the git project
`$ git clone https://github.com/TheAbyssBr0/ProjectFelisha.git`

Navigate into the directory and then:
`$ nim c main.nim`
And you're done!

### TODO (put feature requests in Issues!):
 - [ ] Placeholder
