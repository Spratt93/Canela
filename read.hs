-- Haskell file that reformats simple Turtle documents
-- NOTE: We treat ':', ';' and ',' as special characters
--          -> A line cannot have a ':', unless within the 'http://' or for prefix substitution
--          -> A line cannot have a ';', unless for separating a predicate list
--          -> A line cannot have a ',', unless for separating a object list

import System.Environment
import System.IO
import Data.List
import TTLParser

main :: IO ()
main = do
  (fileName : _) <- getArgs
  sourceText <- readFile fileName
  sourceTextFoo <- readFile "foo.ttl"
  sourceTextBar <- readFile "bar.ttl"
  sourceTextFooProb5 <- readFile "fooProb5.ttl"
  let fooTriples = fromFileToTriples sourceTextFoo
--  putStrLn ("Foo Triples = \n" ++ (prettyPrintTupleTriples fooTriples))
  let barTriples = fromFileToTriples sourceTextBar
--  putStrLn ("Bar Triples = \n" ++ (prettyPrintTupleTriples barTriples))
  let fooProb5 = fromFileToTriples sourceTextFooProb5
  putStrLn ("FooProb5 Triples = \n" ++ (prettyPrintTupleTriples fooProb5))
  let ex1 = joinTriples fooTriples barTriples
  putStrLn ("ex1: \n" ++ prettyPrintTupleTriples ex1)
  let ex2 = selectFrom fooTriples "http://www.cw.org/#problem2" "" "true"
  putStrLn ("ex2: \n" ++ prettyPrintTupleTriples ex2)
  let p1 = (selectFrom fooTriples "" "http://www.cw.org/problem3/#predicate1" "")
  let p2 = (selectFrom fooTriples "" "http://www.cw.org/problem3/#predicate2" "")
  let p3 = (selectFrom fooTriples "" "http://www.cw.org/problem3/#predicate3" "")
  let ex3 = joinTriples p1 (joinTriples p2 p3)
  putStrLn ("ex3: \n" ++ prettyPrintTupleTriples ex3)
  let t1 = (linkTriples fooTriples third tripleToEmptyString tripleToEmptyString barTriples)
  let t2 = (linkTriples barTriples third tripleToEmptyString tripleToEmptyString fooTriples)
  let ex4 = joinTriples t1 t2
  putStrLn("ex4: \n" ++ prettyPrintTupleTriples ex4)
  -- create a list of the triples that should have "true" as the object
  let ex5Part1 = addTriplesOnConditionInt fooProb5 fooProb5 (\o -> (read(o) >0) && (read(o) <99)) "object" "Int" (\x -> 1)
  putStrLn ("ex5Part1: \n" ++ prettyPrintTupleTriples ex5Part1)
  -- create a list of the triples that should have "false" as the object
  let ex5Part2 = addTriplesOnConditionInt fooProb5 fooProb5 (\o -> (read(o) <0) || (read(o) >99)) "object" "Int" (\x -> 0)
  putStrLn ("ex5Part2: \n" ++ prettyPrintTupleTriples ex5Part2)
  -- create a list of triples that should be removed since the number is outside the range
--  let ex5Part3 = addTriplesOnConditionInt fooProb5 fooProb5 (\o -> (read(o) < 0) && (read(o) > 99)) "object" "Int" (\x -> x)
--  putStrLn ("ex5Part3: \n" ++ prettyPrintTupleTriples ex5Part3)
  -- create a list of the triples that should have the number incremented, with the number incremented
  let ex5Part4 = addTriplesOnConditionInt fooProb5 fooProb5 (\o -> (read(o) < 0) && (read(o) > 99)) "object" "Int" (\x -> x + 1)
  putStrLn ("ex5Part4: \n" ++ prettyPrintTupleTriples ex5Part4)
  -- join the parts of the solution together to get the incremented triples, the "true" triples and the "false" triples
  let ex5Part5 = joinTriples ex5Part4 (joinTriples ex5Part2 ex5Part1)
  putStrLn("ex5Part5: \n" ++ prettyPrintTupleTriples ex5Part5)
--  let ex5 = addTriplesOnConditionInt (alterTriples fooProb5 "object" (exercise5Function) "Int") (alterTriples fooProb5 "object" (exercise5Function) "Int") (\o -> (read(o) >0) && (read(o) <99)) "object" "Int" (\x -> "true")
--  putStrLn ("ex5: \n" ++ prettyPrintTupleTriples ex5)
  -- what we really need is a function that takes a triple and outputs a list of triples based on some rules i think
  -- may be interesting to code up

-- LEGACY DEBUGGING CODE
--  let parserText = parseFile sourceText
--  let parsedLines = parseLines parserText
--  let base = getBase parsedLines
--  let prefixes = [(removePrecedingSpace a, addBaseToPrefix base (removePrecedingSpace b)) | (a,b) <- getPrefixes parsedLines]
--  let triples = getTriples parsedLines
--  let updatedTriples = [updateTriple base prefixes t | t <- triples]
--  let sortedTriples = sort updatedTriples
--  let tupleTriples = getTupleTriples sortedTriples
--  -- Print commands that show information about the stages of parsing the input file
--  putStrLn ("ParserText = " ++ show (parserText))
--  putStrLn("Base = " ++ show (base) ++ "\n")
--  putStrLn("Prefixes = " ++ show (prefixes) ++ "\n")
--  putStrLn("Triples = " ++ show (triples) ++ "\n")
--  putStrLn("Updated Triples = " ++ show (updatedTriples) ++ "\n")
--  putStrLn("Sorted Triples = " ++ show (sortedTriples) ++ "\n")
--  putStrLn("Tuple Triples = " ++ show (tupleTriples) ++ "\n")
--  putStrLn (prettyPrintTupleTriples tupleTriples)

-- func :: [line, line, ...] -> [("base", line), ("prefix", line), ("triple", line), ...]
-- Takes each line from the list and categorises it as a triple, prefix or a base in tuples, and adds them in a list
parseLines :: [String] -> [(String, String)]
parseLines parsedSourceText = [parseLine p | p <- parsedSourceText]

parseLine :: String -> (String, String)
parseLine ('@':'b':'a':'s':'e':line) = ("base", line)
parseLine ('@':'p':'r':'e':'f':'i':'x':line) = ("prefix", line)
parseLine line = (categoriseTriple line, line) -- objectList, predicateList or triple

categoriseTriple :: String -> String
categoriseTriple str
  | elem ';' str = "predicateList"
  | elem ',' str = "objectList"
  | otherwise = "triple"

-- func :: "<aa> <bb> <cc>" -> Accumulator -> ["<aa>", "<bb>", "<cc>"]
-- Takes one line of triples and adds each element of it inside a list
parseTriple :: String -> String -> [String]
parseTriple "" acc = [acc]
parseTriple (' ':xs) acc = parseTriple xs acc
parseTriple ('>':xs) acc = [acc ++ ">"] ++ (parseTriple xs "")
parseTriple (x:xs) acc = parseTriple xs (acc ++ [x])

-- func :: [("base", baseLine), ("prefix", line), ("triple", line), ...] -> baseLine
-- Finds the tuple categorised as "base" and returns its content
getBase :: [(String, String)] -> String
getBase lines = head $ map snd $ filter (\x -> fst x == "base") lines

-- Takes all prefixes and puts them into a list of tuples that hold the prefix name and its content
getPrefixes :: [(String, String)] -> [(String, String)]
getPrefixes [] = []
getPrefixes (("prefix",line):lines) = parsePrefix line "":getPrefixes lines
getPrefixes (_:lines) = getPrefixes lines

--classify the lines into triple, objectList or predicateList, then make tuples containing (classification, line)
getTriples :: [(String, String)] -> [String]
getTriples lines = (map snd $ filter (\x -> fst x == "triple") lines)
                   ++ (concat [expandObjectLists l | l <- (map snd $ filter (\x -> fst x == "objectList") lines)])
                   ++ (concat [expandPredicateLists p | p <- map snd $ filter (\x -> fst x == "predicateList") lines])

--takes an objectList and expands it into a list of the full triples that it describes
expandObjectLists :: String -> [String]
expandObjectLists string = [subject ++ predicate ++ object | object <- objects]
  where subject = (takeWhile (\x -> x /= '>') string) ++ ">"
        predicate = (takeWhile (\x -> x /= '>') (drop (length subject) string)) ++ ">"
        splitList = splitOnChar ',' string ""
        objects = drop ((length subject) + (length predicate)) ( splitList !! 0) : (tail splitList)

--takes a predicateList and expands it into a list of the full triples that it describes
expandPredicateLists :: String -> [String]
expandPredicateLists string = [subject ++ predicateAndObject | predicateAndObject <- predicatesAndObjects]
  where subject = (takeWhile (\x -> x /= '>') string) ++ ">"
        splitList = splitOnChar ';' string ""
        predicatesAndObjects = drop ((length subject)) ( splitList !! 0) : (tail splitList)

--Splits a string into a list of strings on a given char delimiter
splitOnChar :: Char -> String -> String -> [String]
splitOnChar c [] acc = [acc]
splitOnChar c (x:xs) acc | c == x = acc : splitOnChar c xs []
                         | otherwise = splitOnChar c xs (acc ++ [x])

-- func :: "http://baseText/" -> [("foo", "<blabla/"), ("bar", "ewewew/"), ...] -> "<aa> <bb> <cc>" -> "<http://..> <http://..> <http://.."
-- Takes the base link, a list of prefixes categorised, and a triple, and returns the fully expanded triple
updateTriple :: String -> [(String, String)] -> String -> String
updateTriple base prefixes triple = updateBase base prefixes (pt !! 0)
                                    ++ updateBase base prefixes (pt !! 1)
                                    ++ updateBase base prefixes (pt !! 2)
  where pt = parseTriple triple []

prefixSwap :: [(String, String)] -> String -> String
prefixSwap [] string = string
prefixSwap prefixes string | take (length (fst (head prefixes))) (tail string) == fst (head prefixes) = init (snd (head prefixes)) ++ drop (length (fst (head prefixes)) + 1) (tail string)
                           | otherwise = prefixSwap (tail prefixes) string

-- Takes a prefix and returns a tuple of the prefix name and its content
parsePrefix :: String -> String -> (String, String)
parsePrefix [] acc = (acc, [])
parsePrefix (':':xs) acc = (acc, xs)
parsePrefix (x:xs) acc = parsePrefix xs (acc ++ [x])

removePrecedingSpace :: String -> String
removePrecedingSpace (' ':xs) = xs
removePrecedingSpace xs = xs

-- if its a link then no change, if a prefix then substitute, otherwise substitute the base
updateBase :: String -> [(String, String)] -> String -> String
updateBase base prefixes string | take 8 string == "<http://" || take 9 string == " <http://" = string
                                | elem ':' string = prefixSwap prefixes string
                                | take 1 string == "<" = init base ++ tail (string)
                                | otherwise = string

addBaseToPrefix :: String -> String -> String
addBaseToPrefix base link@('<':'h':'t':'t':'p':':':'/':'/':xs) = link
addBaseToPrefix base xs = init base ++ tail xs

-- Functions below are all for readability

getTupleTriples sortedTriples = cleanTupleTriples [((splitOnChar '>' triple "") !! 0, (splitOnChar '>' triple "") !! 1,
                                       (splitOnChar '>' triple "") !! 2) | triple <- sortedTriples]

cleanTupleTriples triples = [(cleanString s, cleanString p, cleanString o) | (s,p,o) <- triples]

cleanString :: String -> String
cleanString ('<':xs) = xs
cleanString xs = xs

prettyPrintTupleTriples :: [(String, String, String)] -> String
prettyPrintTupleTriples [] = ""
prettyPrintTupleTriples ((s, p, o):xs) | take 7 o == "http://" = ("<" ++ s ++ ">" ++ "<" ++ p ++ ">" ++ "<" ++ o ++ ">") ++ " \n" ++ (prettyPrintTupleTriples xs)
                                       | otherwise = ("<" ++ s ++ ">" ++ "<" ++ p ++ ">" ++ o) ++ " \n" ++ (prettyPrintTupleTriples xs)

fromFileToTriples :: String -> [(String, String, String)]
fromFileToTriples sourceText = getTupleTriples (sort [updateTriple base prefixes t | t <- (getTriples parsedLines)])
  where parsedLines = parseLines (parseFile sourceText)
        base = getBase parsedLines
        prefixes = [(removePrecedingSpace a, addBaseToPrefix base (removePrecedingSpace b)) | (a,b) <- getPrefixes parsedLines]

uniqueTriples :: [(String, String, String)] -> [(String, String, String)] -> [(String, String, String)]
uniqueTriples [] acc = acc
uniqueTriples [(s, p, o)] acc = (s, p, o): acc
uniqueTriples ((s, p, o):xs) acc | not (elem (s, p, o) acc) = uniqueTriples xs ((s,p,o):acc)
                                 | otherwise = uniqueTriples xs acc

sortedTriples :: [(String, String, String)] -> [(String, String, String)]
sortedTriples ts = sortBy (compareTriples) ts
  where compareTriples (s1, p1, o1) (s2, p2, o2) = compare (s1 ++ p1 ++ o1) (s2 ++ p2 ++ o2)

joinTriples :: [(String, String, String)] -> [(String, String, String)] -> [(String, String, String)]
joinTriples f1Triples f2Triples = sortedTriples (uniqueTriples (f1Triples ++ f2Triples) [])

intersectionTriples :: [(String, String, String)] -> [(String, String, String)] -> [(String, String, String)]
intersectionTriples f1Triples f2Triples = sortedTriples (uniqueTriples [(s, p, o) | (s, p, o) <- f1Triples, elem (s, p, o) f2Triples] [])

--compareTriples :: [(String, String, String)] -> [(String, String, String)] -> Ordering
--compareTriples (s1, p1, o1) (s2, p2, o2) = compare (s1 ++ p1 ++ o1) (s2 ++ p2 ++ o2)

selectFrom :: [(String, String, String)] -> String -> String -> String -> [(String, String, String)]
selectFrom file subject predicate object = selectSubject subject (selectPredicate predicate (selectObject object file))

selectSubject :: String -> [(String, String, String)] -> [(String, String, String)]
selectSubject subject file | subject == "" = file
                           | otherwise = [(s, p, o) | (s, p, o) <- file, s == subject]

selectPredicate :: String -> [(String, String, String)] -> [(String, String, String)]
selectPredicate predicate file | predicate == "" = file
                               | otherwise = [(s, p ,o) | (s, p, o) <- file, p == predicate]

selectObject :: String -> [(String, String, String)] -> [(String, String, String)]
selectObject object file | object == "" = file
                         | otherwise = [(s, p, o) | (s, p, o) <- file, o == object]

removeFrom :: [(String, String, String)] -> String -> String -> String -> [(String, String, String)]
removeFrom file subject predicate object = removeSubject subject (removePredicate predicate (removeObject object file))

removeSubject :: String -> [(String, String, String)] -> [(String, String, String)]
removeSubject subject file | subject == "" = file
                           | otherwise = [(s, p, o) | (s, p, o) <- file, s /= subject]

removePredicate :: String -> [(String, String, String)] -> [(String, String, String)]
removePredicate predicate file | predicate == "" = file
                               | otherwise = [(s, p ,o) | (s, p, o) <- file, p /= predicate]

removeObject :: String -> [(String, String, String)] -> [(String, String, String)]
removeObject object file | object == "" = file
                         | otherwise = [(s, p, o) | (s, p, o) <- file, o /= object]

-- example call: linkTriples file1 (fst) (tripleToEmptyString) (third) file2
linkTriples :: [(String, String, String)] -> ((String, String, String) -> String) -> ((String, String, String) -> String) -> ((String, String, String) -> String) -> [(String, String, String)] -> [(String, String, String)]
linkTriples file1 matchSubjectFn matchPredicateFn matchObjectFn file2 = [(s, p, o) | (s, p, o) <- file1, hasLink (matchSubjectFn (s, p, o)) (matchPredicateFn (s, p, o)) (matchObjectFn (s,p,o)) file2]

hasLink :: String -> String -> String -> [(String, String, String)] -> Bool
hasLink matchSubject matchPredicate matchObject file = length selection > 0
  where selection = (selectFrom file matchSubject matchPredicate matchObject)

third :: (a, a, a) -> a
third (_, _, x) = x

tripleToEmptyString :: (a, a, a) -> String
tripleToEmptyString (_, _, _) = ""

alterTriples :: (Show a, Read a) => [(String, String, String)] -> String -> (a -> a) -> String -> [(String, String, String)]
alterTriples triples selection mutatorFn selectionType | selectionType == "Int" && selection == "subject" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt s]
                                                       | selectionType == "Int" && selection == "predicate" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt p]
                                                       | selectionType == "Int" && selection == "object" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt o]
                                                       | selectionType == "Bool" && selection == "subject" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool s]
                                                       | selectionType == "Bool" && selection == "predicate" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool p]
                                                       | selectionType == "Bool" && selection == "object" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool o]
                                                       | selectionType == "String" = [alterTriple (s, p, o) selection mutatorFn | (s, p, o) <- triples]

alterTripleBool :: (Show a, Read a) => (String, String, String) -> String -> (a -> a) -> (String, String, String)
alterTripleBool (s, p, o) selection mutatorFn | selection == "subject" && isStringBool s = (show (mutatorFn (read s)), p, o)
                                              | selection == "predicate" && isStringBool p = (s, show (mutatorFn (read p)), o)
                                              | selection == "object" && isStringBool o = (s, p, show (mutatorFn (read o)))
                                              | otherwise = error "Alteration Failed"

alterTripleInt :: (Show a, Read a) => (String, String, String) -> String -> (a -> a) -> (String, String, String)
alterTripleInt (s, p, o) selection mutatorFn | selection == "subject" && isStringInt s = (show (mutatorFn (read s)), p, o)
                                             | selection == "predicate" && isStringInt p = (s, show (mutatorFn (read p)), o)
                                             | selection == "object" && isStringInt o = (s, p, show (mutatorFn (read o)))
                                             | otherwise = error "Alteration Failed"

alterTriple :: (String, String, String) -> String -> (a -> a) -> (String, String, String)
alterTriple (s, p, o) selection mutatorFn | selection == "subject" = (s, p, o)
                                          | selection == "predicate" = (s, p, o)
                                          | selection == "object" = (s, p, o)
                                          | otherwise = error "Alteration Failed"

-- Need to make conditions work properly with read and the types :/ use the selection to simplify things
addTriplesOnConditionInt :: [(String, String, String)] -> [(String, String, String)] -> (String -> Bool) -> String -> String -> (Int -> Int) -> [(String, String, String)]
addTriplesOnConditionInt [] newTriples condition selection selectionType mutatorFn = []
addTriplesOnConditionInt ((s, p, o):triples) newTriples condition selection selectionType mutatorFn | selectionType == "Int" && selection == "subject" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt s]
                                                                                                    | selectionType == "Int" && selection == "predicate" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt p]
                                                                                                    | selectionType == "Int" && selection == "object" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt o]
                                                                                                    | otherwise = error "Incorrect type"

addTriplesOnConditionBool :: (Show a, Read a) => [(String, String, String)] -> [(String, String, String)] -> (String -> Bool) -> String -> String -> (a -> a) -> [(String, String, String)]
addTriplesOnConditionBool [] newTriples condition selection selectionType mutatorFn = []
addTriplesOnConditionBool ((s, p, o):triples) newTriples condition selection selectionType mutatorFn | selectionType == "Bool" && selection == "subject" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool s]
                                                                                                     | selectionType == "Bool" && selection == "predicate" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool p]
                                                                                                     | selectionType == "Bool" && selection == "object" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool o]
                                                                                                     | otherwise = error "Incorrect type"

addTriplesOnConditionString :: [(String, String, String)] -> [(String, String, String)] -> (String -> Bool) -> String -> String -> (a -> a) -> [(String, String, String)]
addTriplesOnConditionString [] newTriples condition selection selectionType mutatorFn = []
addTriplesOnConditionString ((s, p, o):triples) newTriples condition selection selectionType mutatorFn | selectionType == "String" = [alterTriple (s, p, o) selection mutatorFn | (s, p, o) <- triples]
                                                                                                       | otherwise = error "Incorrect type"

                                                                                                 --if the match is not met then the triples are not returned :( need a way to keep the ones that cannot be altered

addTripleOnCondition :: (Show a, Read a) => [(String, String, String)] -> (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
addTripleOnCondition triples (s, p, o) condition selection mutatorFn = joinTriples triples (getTripleOnCondition (s, p, o) condition selection mutatorFn)

addTripleOnConditionInt :: [(String, String, String)] -> (String, String, String) -> (String -> Bool) -> String -> (Int -> Int) -> [(String, String, String)]
addTripleOnConditionInt triples (s, p, o) condition selection mutatorFn = joinTriples triples (getTripleOnConditionInt (s, p, o) condition selection mutatorFn)

addTripleOnConditionBool :: (Show a, Read a) => [(String, String, String)] -> (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
addTripleOnConditionBool triples (s, p, o) condition selection mutatorFn = joinTriples triples (getTripleOnConditionBool (s, p, o) condition selection mutatorFn)

getTripleOnCondition :: (Show a, Read a) => (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
getTripleOnCondition (s, p, o) condition selection mutatorFn | selection == "subject" && condition s = [alterTriple (s, p, o) selection mutatorFn]
                                                             | selection == "predicate" && condition p = [alterTriple (s, p, o) selection mutatorFn]
                                                             | selection == "object" && condition o = [alterTriple (s, p, o) selection mutatorFn]
                                                             | otherwise = []

getTripleOnConditionInt :: (Show a, Read a) => (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
getTripleOnConditionInt (s, p, o) condition selection mutatorFn | selection == "subject" && condition s = [alterTripleInt (s, p, o) selection mutatorFn]
                                                                | selection == "predicate" && condition p = [alterTripleInt (s, p, o) selection mutatorFn]
                                                                | selection == "object" && condition o = [alterTripleInt (s, p, o) selection mutatorFn]
                                                                | otherwise = []

getTripleOnConditionBool :: (Show a, Read a) => (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
getTripleOnConditionBool (s, p, o) condition selection mutatorFn | selection == "subject" && condition s = [alterTripleBool (s, p, o) selection mutatorFn]
                                                                 | selection == "predicate" && condition p = [alterTripleBool (s, p, o) selection mutatorFn]
                                                                 | selection == "object" && condition o = [alterTripleBool (s, p, o) selection mutatorFn]
                                                                 | otherwise = []

---- Need to make conditions work properly with read and the types :/ use the selection to simplify things
--removeTriplesOnConditionInt :: (Show a, Read a) => [(String, String, String)] -> [(String, String, String)] -> (String -> Bool) -> String -> String -> (a -> a) -> [(String, String, String)]
--removeTriplesOnConditionInt [] newTriples condition selection selectionType mutatorFn = []
--removeTriplesOnConditionInt ((s, p, o):triples) newTriples condition selection selectionType mutatorFn | selectionType == "Int" && selection == "subject" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt s]
--                                                                                                       | selectionType == "Int" && selection == "predicate" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt p]
--                                                                                                       | selectionType == "Int" && selection == "object" = [alterTripleInt (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringInt o]
--                                                                                                       | otherwise = error "Incorrect type"
--
--removeTriplesOnConditionBool :: (Show a, Read a) => [(String, String, String)] -> [(String, String, String)] -> (String -> Bool) -> String -> String -> (a -> a) -> [(String, String, String)]
--removeTriplesOnConditionBool [] newTriples condition selection selectionType mutatorFn = []
--removeTriplesOnConditionBool ((s, p, o):triples) newTriples condition selection selectionType mutatorFn | selectionType == "Bool" && selection == "subject" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool s]
--                                                                                                        | selectionType == "Bool" && selection == "predicate" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool p]
--                                                                                                        | selectionType == "Bool" && selection == "object" = [alterTripleBool (s, p, o) selection mutatorFn | (s, p, o) <- triples, isStringBool o]
--                                                                                                        | otherwise = error "Incorrect type"
--
--removeTriplesOnConditionString :: [(String, String, String)] -> [(String, String, String)] -> (String -> Bool) -> String -> String -> (a -> a) -> [(String, String, String)]
--removeTriplesOnConditionString [] newTriples condition selection selectionType mutatorFn = []
--removeTriplesOnConditionString ((s, p, o):triples) newTriples condition selection selectionType mutatorFn | selectionType == "String" = [alterTriple (s, p, o) selection mutatorFn | (s, p, o) <- triples]
--                                                                                                       | otherwise = error "Incorrect type"
--
--                                                                                                 --if the match is not met then the triples are not returned :( need a way to keep the ones that cannot be altered
--
--removeTripleOnCondition :: (Show a, Read a) => [(String, String, String)] -> (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
--removeTripleOnCondition triples (s, p, o) condition selection mutatorFn = joinTriples triples (getTripleOnCondition (s, p, o) condition selection mutatorFn)
--
--removeTripleOnConditionInt :: (Show a, Read a) => [(String, String, String)] -> (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
--removeTripleOnConditionInt triples (s, p, o) condition selection mutatorFn = joinTriples triples (getTripleOnConditionInt (s, p, o) condition selection mutatorFn)
--
--removeTripleOnConditionBool :: (Show a, Read a) => [(String, String, String)] -> (String, String, String) -> (String -> Bool) -> String -> (a -> a) -> [(String, String, String)]
--removeTripleOnConditionBool triples (s, p, o) condition selection mutatorFn = joinTriples triples (getTripleOnConditionBool (s, p, o) condition selection mutatorFn)

differenceTriples :: [(String, String, String)] -> [(String, String, String)] -> [(String, String, String)]
differenceTriples triples1 triples2 = [(s, p, o) | (s, p, o) <- triples1, not (elem (s, p, o) triples2)]

exercise5Function :: String -> String
exercise5Function s | read s < 0 = "false"
                    | read s > 99 = "false"
                    | otherwise = show ((read s) + 1)

isStringInt :: String -> Bool
isStringInt [] = True
isStringInt (x:xs) | elem x ['0'..'9'] = isStringInt xs
                   | otherwise = False

isStringBool :: String -> Bool
isStringBool s | s == "true" = True
               | s == "false" = True
               | otherwise = False

-- need to find a way to get what to match on, given some instructions and the actual tuples to match on

--matching instructions: subject == subject, subject == predicate, subject == object,
--                       predicate == subject, prediacte == predicate, predicate == object,
--                       object == subject, object == predicate, object == object
--so a datastructure (String, String, String) will suffice
--and ("object", "", "object") would mean that subject == object, no predicate match, object == object
--lots of cases, but this is possible to code
--
--or maybe write a getobject and getsubject funtion annd match on that stuff in a clever way>>>???
--
--linkTriples file1 file2 (getObject == anySubject)
--linkTriple (s, p, o) file2 (o == anySubject file2)
--
--ok but we can automatically do s==, p==, o==
--so feed 3 things to match on
--linkTriple (s, p, o) file2 (anyObject, none, none) =
