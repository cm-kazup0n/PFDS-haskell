module BinomialHeapSpec (spec) where

import BinomialHeap
import Lib
import Test.Hspec

e :: Heap Int
e = []

spec :: Spec
spec = do
  describe "insert" $ do
    it "insert 1" $ do
      insert 1 empty `shouldBe`  [(0,Node 1 [])]
    it "insert 1,2" $ do
      insert 2 (insert 1 empty) `shouldBe` [(1,Node 1 [Node 2 []])]
    it "insert 1,2,5" $ do
      insert 1 (insert 5 (insert 2 empty)) `shouldBe` [(0,Node 1 []),(1,Node 2 [Node 5 []])]
    it "insert 2,5,1" $ do
      insert 2 (insert 5 (insert 1 empty)) `shouldBe` [(0,Node 2 []),(1,Node 1 [Node 5 []])]
    it "insert 99,17,21,5" $ do
      insert 99 (insert 17 (insert 21 (insert 5 empty))) `shouldBe` [(2,Node 5 [Node 17 [Node 99 []],Node 21 []])]
  -- describe "removeMinTree" $ do
  --   it "return Nothing when empty" $ do
  --     removeMinTree ([] :: Heap Int) `shouldBe` Nothing
  --   it "return Nothing when empty" $ do
  --     removeMinTree (insert 5 empty) `shouldBe` Just (Node 0 5 [], [])
  --   it "return 1 when tree with 1,5" $ do
  --     removeMinTree (insert 5 (insert 1 empty)) `shouldBe` Just (Node 1 1 [Node 0 5 []],[])
  -- describe "findMin" $ do
  --   it "returns 1 when tree contains 5 2 1" $ do
  --     findMin (insert 5 (insert 2 (insert 1 empty))) `shouldBe` Just 1
  --   it "returns 5 when tree contains 99,17,21,5" $ do
  --     findMin (insert 5 (insert 99 (insert 18 (insert 21 empty)))) `shouldBe` Just 5
  describe "findMin2" $ do
    it "returns 1 when tree contains 5 2 1" $ do
      findMin2 (insert 5 (insert 2 (insert 1 empty))) `shouldBe` Just 1
    it "returns 5 when tree contains 99,17,21,5" $ do
      findMin2 (insert 5 (insert 99 (insert 18 (insert 21 empty)))) `shouldBe` Just 5
    it "returns Nothing when empty" $ do
      findMin2 e `shouldBe` Nothing
    it "returns Just 1" $ do
      findMin2 (insert 1 empty) `shouldBe` Just 1