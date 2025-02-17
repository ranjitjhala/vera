{-# LANGUAGE QuasiQuotes #-}
module IonMonkeyGenerated.Helpers where
import           Data.List
import           Data.String.Interpolate
import           DSL.Typed               (Type (..))
import           Generate.Lang
import           Generate.QQ
import           Generate.SMTAST
import           Generate.State

{-|

This file is here because we used to do all DSL-writing as EDSL-writing before
John wrote the parser (!!!). The BrokenIntersect function is still expressed in
the EDSL, though, which is why I haven't eliminated this file.

-}

p :: Program
p = [progFile|src/IonMonkeyGenerated/code.cpp|]

prog_func :: Program -> String -> FunctionDef
prog_func (Program fs _) s = case find (\fd -> fName fd == s) fs of
                                      Just func -> func
                                      Nothing -> error "Couldn't find function"

fn :: String -> FunctionDef
fn = prog_func p

range3 :: FunctionDef
range3 = fn "Range3"

range4 :: FunctionDef
range4 = fn "Range4"

range6 :: FunctionDef
range6 = fn "Range6"

-- | https://searchfox.org/mozilla-central/source/js/src/jit/RangeAnalysis.h#394
newInt32Range :: FunctionDef
newInt32Range = fn "newInt32Range"

newUInt32Range :: FunctionDef
newUInt32Range = fn "newUInt32Range"

setLowerInit :: FunctionDef
setLowerInit = fn "setLowerInit"

setUpperInit :: FunctionDef
setUpperInit = fn "setUpperInit"

-- | https://searchfox.org/mozilla-central/source/js/src/jit/RangeAnalysis.h#566
canHaveSignBitSet :: FunctionDef
canHaveSignBitSet = fn "canHaveSignBitSet"

exponentImpliedByInt32Bounds :: FunctionDef
exponentImpliedByInt32Bounds = fn "exponentImpliedByInt32Bounds"

nullRange :: FunctionDef
nullRange = fn "nullRange"

--- Less complicated stuff

range_constructor :: FunctionDef
range_constructor = undefined

excludesFractionalParts :: Codegen SExpr
excludesFractionalParts = n Bool 0

excludesFractionalPartsS :: String
excludesFractionalPartsS = [i| ((bool) 0) |]

int32min :: Codegen SExpr
int32min = n Signed (-2147483648)

int32minS :: String
int32minS = [i| ((int32_t) -2147483648) |]

int32max :: Codegen SExpr
int32max = n Signed 2147483647

int32maxS :: String
int32maxS = [i| ((int32_t) 2147483647) |]

uint32max :: Codegen SExpr
uint32max = n Unsigned 4294967295

uint32maxS :: String
uint32maxS = [i| ((uint32_t) 4294967295) |]

uint32min :: Codegen SExpr
uint32min = n Unsigned 0

uint32minS :: String
uint32minS = [i| ((uint32_t) 0) |]

excludesNegativeZero :: Codegen SExpr
excludesNegativeZero = n Bool 0

excludesNegativeZeroS :: String
excludesNegativeZeroS = [i| ((bool) 0) |]

maxFiniteExponent :: Codegen SExpr
maxFiniteExponent = n Unsigned16 1023

maxFiniteExponentS :: String
maxFiniteExponentS = [i| ((uint16_t) 1023) |]

includesInfinity :: Codegen SExpr
includesInfinity = n Unsigned16 1024

includesInfinityS :: String
includesInfinityS = [i| ((uint16_t) 1 + #{maxFiniteExponentS}) |]

includesInfinityAndNan :: Codegen SExpr
includesInfinityAndNan = n Unsigned16 65535

includesInfinityAndNanS :: String
includesInfinityAndNanS = [i| ((uint16_t) 65535) |]

noInt32LowerBound :: Codegen SExpr
noInt32LowerBound = (cast jsIntMin Signed64) .-. n Signed64 1

noInt32LowerBoundS :: String
noInt32LowerBoundS= [i| ((int64_t) #{jsIntMinS} - (int64_t) 1) |]

noInt32UpperBound :: Codegen SExpr
noInt32UpperBound = (cast jsIntMax Signed64) .+. n Signed64 1

noInt32UpperBoundS :: String
noInt32UpperBoundS= [i| ((int64_t) #{jsIntMaxS} + (int64_t) 1) |]

jsIntMax :: Codegen SExpr
jsIntMax = n Signed (0x7fffffff)

jsIntMaxS :: String
jsIntMaxS = [i| ((int32_t) 0x7fffffff) |]

jsIntMin :: Codegen SExpr
jsIntMin = n Signed (0x80000000)

jsIntMinS :: String
jsIntMinS = [i| ((int32_t) 0x80000000) |]

jsIntMax64 :: Codegen SExpr
jsIntMax64 = n Signed64 2147483647

jsIntMax64S :: String
jsIntMax64S = [i| ((int64_t) 2147483647) |]

jsIntMin64 :: Codegen SExpr
jsIntMin64 = n Signed64 (-2147483648)

-- | https://searchfox.org/mozilla-central/source/js/src/jit/RangeAnalysis.h#489
hasInt32Bounds :: FunctionDef
hasInt32Bounds = fn "hasInt32Bounds"

numBits :: FunctionDef
numBits = fn "numBits"

canBeFiniteNonNegative :: FunctionDef
canBeFiniteNonNegative = fn "canBeFiniteNonNegative"

canBeFiniteNegative :: FunctionDef
canBeFiniteNegative = fn "canBeFiniteNegative"

isFiniteNonNegative :: FunctionDef
isFiniteNonNegative = fn "isFiniteNonNegative"

isFiniteNegative :: FunctionDef
isFiniteNegative = fn "isFiniteNegative"

canBeInfiniteOrNan :: FunctionDef
canBeInfiniteOrNan = fn "canBeInfiniteOrNan"

missingAnyInt32Bounds :: FunctionDef
missingAnyInt32Bounds = fn "missingAnyInt32Bounds"

canBeNan :: FunctionDef
canBeNan = fn "canBeNan"

canBeZero :: FunctionDef
canBeZero = fn "canBeZero"

contains :: FunctionDef
contains = fn "contains"

-- | http://aggregate.org/MAGIC/#Population%20Count%20(Ones%20Count)
countOnes :: FunctionDef
countOnes = fn "countOnes"

countLeadingZeroes :: FunctionDef
countLeadingZeroes = fn "countLeadingZeroes"
