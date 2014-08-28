# Strings and char lists
"string" # string
'char list' # char list

# Strings are all encoded in UTF-8:
"José" #=> "José"

# `?a` returns the ASCII integer for the letter `a`
?a #=> 97

# Strings are really binaries, and char lists are linked lists.
<<?a, ?b, ?c>> #=> "abc"
[?a, ?b, ?c]   #=> 'abc'
