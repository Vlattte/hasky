data Nat = Zero | Succ Nat

class MatrixNum (n :: Nat) where
    type Matrix n :: * -> *
    type Vector n :: * -> *
    mmul :: Num a => Matrix n a -> Matrix n a -> Matrix n a
    vmul :: Num a => Matrix n a -> Vector n a -> Vector n a

newtype ListMatrix (n :: Nat) a = ListMatrix [[a]] deriving Show
newtype ListVector (n :: Nat) a = ListVector [a] deriving Show

instance MatrixNum n where
    type Matrix n = ListMatrix n
    type Vector n = ListVector n
    mmul (ListMatrix xss) (ListMatrix yss) = ListMatrix $ error "Not implemented"
    vmul (ListMatrix xss) (ListVector ys) = ListVector $ error "Not implemented"


main = do
    let m = MatrixNum 2
    print(m)