succ 1 -- увеличивает на 1
[1, 2, 3] ++ [6, 7, 8] -- склеивает списки
"hello" ++ " " ++ "world" -- или строки

'A':" SMALL CAT"    -- тоже склейка
"AA":" SMALL CAT"   -- ошибка, склеивать так можно по одному
5:[1,2,3,4,5]       -- нормас склейка

-- !! получить элемент по индексу
"Steve Buscemi" !! 6              --'B'
[9.4,33.2,96.2,11.2,23.25] !! 1   -- 33.2

-- tail и head
tail [5,4,3,2,1] -- [4,3,2,1]   (все кроме первого)
head [5,4,3,2,1] -- 5           (первый)

-- last и init
last [5,4,3,2,1] -- 1           (последний)
init [5,4,3,2,1] -- [5,4,3,2]   (все кроме последнего)

length [5,4,3,2,1] -- 5 - длина списка

-- null проверяет пустой ли список
null [1,2,3]    -- False
null []         -- True

-- take берет n элементов списка
take 3 [5,4,3,2,1]      -- [5,4,3]
take 1 [3,9,3]          -- [3]
take 5 [1,2]            -- [1,2]
take 0 [6,6,6]          -- []

-- drop удаляет первые n элементов
drop 3 [8,4,2,1,5,6]    -- [1,5,6]
drop 0 [1,2,3,4]        -- [1,2,3,4]
drop 100 [1,2,3,4]      -- [] 

-- elem ищет элемент 4 в списке
4 `elem` [3,4,5,6]      -- True
10 `elem` [3,4,5,6]     -- False


[1..20] <==> [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]


-- list comprehensions
[x*2 | x <- [1..10]]                    -- [2,4,6,8,10,12,14,16,18,20]
[x*2 | x <- [1..10], x*2 >= 12]         -- [12,14,16,18,20]
[x*y | x <- [2,5,10], y <- [8,10,11]]   -- [16,20,22,40,50,55,80,100,110] 

-- функция, чтобы оставить только upper case
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 
removeNonUppercase "Hahaha! Ahahaha!" -- "HA"

-- zip сопоставление списков
zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]     -- [(5,"im"),(3,"a"),(2,"turtle")]
zip [1..] ["apple", "orange", "cherry", "mango"]    -- [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]

-- :t == type()
:t 'a'      -- 'a' :: Char
:t 4 == 5   -- 4 == 5 :: Bool
:t head     -- head :: [a] -> a

-- The intersperse function takes an element and a list and `intersperses' that element between the elements of the list. For example:
intersperse ',' "abcde"     -- "a,b,c,d,e"

-- intercalate = (concat (intersperse xs xss))
intercalate ", " ["Lorem", "ipsum", "dolor"] -- "Lorem, ipsum, dolor"

-- transpose
transpose [[1,2,3],[4,5,6]] -- [[1,4],[2,5],[3,6]]

-- map применяет операцию к каждому элементу списка
map (+3) [1,5,3,1,6]                -- [4,8,6,4,9]
map (++ "!") ["БУХ", "БАХ", "ПАФ"]  -- ["БУХ!","БАХ!","ПАФ!"]

-- zipWith принимает функцию и два списка, а затем соединяет списки, применяя переданную функцию для соответствующих элементов
zipWith (*) [1,2,3]  [9,47,0]