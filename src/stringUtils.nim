func process_cases(input_str: string, n: int, ret_str: string): (string, int) =               
  if input_str[n - 1] == ' ':     # case: "two words"
    return (ret_str, n)           #           ^ (space)
  if input_str[n] == ' ':         # case: "two words"
    return (ret_str, n + 1)       #          ^  (last to ' ')
  if input_str[n + 1] == ' ':     # case: "two words"
    return (ret_str & input_str[n], n + 2) #^   (2nd last to ' ')
  return (ret_str & '-', n)       # case: "two words"  (else)

func get_substring(input_str: string, upto: int): (string, int) =
  ## returns a substring of length upto from the start of input_str,
  ## returns the starting index of the next character to start printing from
  ## on the next line.
  ## 
  ## the values are meant to represent an entire line and the index of the 
  ## character which is the beginning of the next line
  assert(upto > 1, "Substring must be of length 2 or greater")
  var ret_str: string
  for n, character in input_str.pairs:
    if n >= upto - 1:
      return process_cases(input_str, n, ret_str)
    ret_str.add(character)
  (ret_str, 0)                    # case: required len > string len