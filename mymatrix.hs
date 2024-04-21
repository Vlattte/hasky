import Data.List

data Matrix a = Matrix [[a]]
              deriving (Eq)

-- переопрееляем вывод для матриц
instance Show a => Show (Matrix a)
  where
    show (Matrix a) = intercalate "\n" (map (intercalate " " . map show) a)

-- сложение
plus :: Num a => [[a]] -> [[a]] -> [[a]]
plus a b = zipWith (zipWith (+)) a b

-- instance (+) a => (+) (Matrix a) (Matrix a)
--   where 
--     (+) (Matrix a) (Matrix b) = plus_mat (Matrix a) (Matrix b)

-- | Identity matrix of the given order.
-- identity :: Num a => Int -> Matrix a
-- identity n = Matrix n n $ \(i,j) -> if i == j then 1 else 0

-- единичная матрица
identity :: Integer -> Matrix Integer
identity n = Matrix [ [if i == j then 1 else 0 | i <- [1..n]] | j <- [1..n]]


-- вычитание
minus :: Num a => [[a]] -> [[a]] -> [[a]]
minus = zipWith (zipWith (-))

-- умножение
prod_mat :: Num a => [[a]] -> [[a]] -> [[a]]
prod_mat a b = [[sum (zipWith (*) ar bc) | bc <- (transpose b)] | ar <- a]

unMatrix :: Matrix a -> [[a]]
unMatrix (Matrix m) = m

-- умножение на число
prodc :: Num a => Matrix a -> a -> Matrix a
prodc b c = Matrix (map (map (*c)) (unMatrix b))


instance Num a => Num (Matrix a)
  where
    (Matrix a) + (Matrix b) = Matrix (a `plus` b)
    (Matrix a) - (Matrix b) = Matrix (a `minus` b)
    (Matrix a) * (Matrix b) = Matrix (prod_mat a b)


main :: IO ()
main = do
  let a = Matrix [[1, 2, 3], [4, 5, 6]]
  let b = Matrix [[1, 2, 3], [-3, -2, 9]]
  print(a*b)
  let c = prodc a 3
  print(identity 10)
