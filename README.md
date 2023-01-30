# Canela

### Querying language for simple [Turtle files](https://www.w3.org/TR/turtle/)

This language was written in Haskell.
- [Alex](https://haskell-alex.readthedocs.io/en/latest/) was used to generate the lexer.
- [Happy](https://haskell-happy.readthedocs.io/en/latest/) was used to generate the parser.
- The execution model was implemented in base Haskell

Canela performs operations on Turtle files like *foo.ttl* 

To execute an *stql* file:

1. `alex Tokens.x` to generate the lexer haskell code 
2. `happy Grammar.y` to generate the parse tree haskell code
3. `ghc Stql.hs` to compile all the required haskell 
4. `./Stql filename.stql` to execute the script *filename*

Syntax highlighted is supported in Notepad++ if you import the *stql.xml*

The syntax/semantics of our language is detailed in the report

Authors: Chris Georgiev, Edward Clewer and Tom Cutts
