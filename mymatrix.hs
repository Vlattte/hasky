import Data.List

data Matrix a = Matrix [[a]]
              deriving (Eq)

-- переопрееляем вывод для матриц
instance Show a => Show (Matrix a)
  where
    show (Matrix a) = intercalate "\n" (map (intercalate " " . map show) a) ++ "\n"

-- сложение
plus :: Num a => [[a]] -> [[a]] -> [[a]]
plus a b = zipWith (zipWith (+)) a b

-- единичная матрица
identity :: Integer -> Matrix Integer
identity n = Matrix [ [if i == j then 1 else 0 | i <- [1..n]] | j <- [1..n]]


-- вычитание
minus :: Num a => [[a]] -> [[a]] -> [[a]]
minus = zipWith (zipWith (-))

-- умножение
prod_mat :: Num a => [[a]] -> [[a]] -> [[a]]
prod_mat a b = [[sum (zipWith (*) ar bc) | bc <- (transpose b)] | ar <- a]

-- умножение
prod_vec :: Num a => Matrix a -> [a] -> [a]
prod_vec a b = [sum (zipWith (*) ar b) | ar <- unMatrix a]

unMatrix :: Matrix a -> [[a]]
unMatrix (Matrix m) = m

-- умножение на число
prodc :: Num a => Matrix a -> a -> Matrix a
prodc b c = Matrix (map (map (*c)) (unMatrix b))

-- транспонировние матриц
transpose_mat :: Num a => Matrix a -> Matrix a
transpose_mat a = Matrix (transpose (unMatrix a))


instance Num a => Num (Matrix a)
  where
    (Matrix a) + (Matrix b) = Matrix (a `plus` b)
    (Matrix a) - (Matrix b) = Matrix (a `minus` b)
    (Matrix a) * (Matrix b) = Matrix (prod_mat a b)


main :: IO ()
main = do
  let a = Matrix [[1, 2, 3], [4, 5, 6], [46, 32, 7]]
  let b = [1, 2, 3]
  -- print(a+b)
  -- print(a-b)
  print(prod_vec a b)
  -- print(identity 10)
  -- let c = prodc a 3
  -- let tran = transpose_mat a
  -- print(a)
  -- print(tran)