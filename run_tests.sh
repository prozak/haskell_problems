#!/bin/sh

for test_name in $1/*.hs
do
    echo $test_name
    test_function=`grep -e '^[^ ]*Test' $test_name | tail -1 | awk '{print $1}'`
    test_header=`head -2 $test_name`
    cat > test_input.hs <<END
$test_header
import Data.Char
import Test.QuickCheck
 
-- Arbitrary Char is now part of the library
-- {-
-- instance Arbitrary [Char] where
--     arbitrary     = choose ('\32', '\128')
--     coarbitrary c = variant (ord c \`rem\` 4)
-- -}

`tail -n +3 $test_name`
END
    echo quickCheck $test_function | ghci -i$1 -v0 test_input.hs #2>/dev/null
    rm test_input.hs
    #echo $test_str $test_function
done
