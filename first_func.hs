-- Мы определям тип используя ::
f :: Int -> Int -> Int
f x y = x*x + y*y

p x y = x*x + y*y

s :: Num a => a -> a -> a
s x y = x*x + y*y

g :: Num a => a -> a
g = s 3


square''' = (^2)

absolute :: (Ord a, Num a) => a -> a
absolute x = if x >= 0 then x else -x

absolute' x
    | x >= 0 = x
    | otherwise = -x

main = do
    print (f 2 3)
    print (p 2.3 4.2)
    print (g 2)

    print(1:2:[])
    print([1,2] ++ [3,4] )

    print(square''' 3)
    print(absolute 5)
    print(absolute (-47))

    print(absolute' 5)
    print(absolute' (-47))