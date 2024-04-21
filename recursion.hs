-- полезные функции
-- even :: Integral a => a -> Bool -- проверка на четность
-- head :: [a] -> a                -- возвращает первый элемент списка
-- tail :: [a] -> [a]              -- возвращает все элементы списка, кроме первого

-- Версия 1
evenSum :: [Integer] -> Integer

evenSum l = accumSum 0 l

accumSum n l = if l == []
                  then n
                  else let x = head l 
                           xs = tail l 
                       in if even x
                              then accumSum (n+x) xs
                              else accumSum n xs

