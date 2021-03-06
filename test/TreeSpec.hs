module TreeSpec (spec) where

import Test.Hspec
import Tree ( insert,member, member2, insert2, insert3, complete, balanced, Tree(E, T) )
  
spec :: Spec 
spec = do 
  describe "insert" $ do
    it "insert to empty tree" $
      insert 1 E `shouldBe` T E 1 E
    it "insert to non-empty tree" $
      insert 2 (T E 1 E) `shouldBe` T E 1 (T E 2 E)
    it "insert to full branch" $
      insert 4 (T (T E 1 E) 2 (T E 3 E)) `shouldBe` T (T E 1 E) 2 (T E 3 (T E 4 E))

  describe "insert2" $ do
    it "insert to empty tree" $
      insert2 1 E `shouldBe` T E 1 E
    it "insert to non-empty tree" $
      insert2 2 (T E 1 E) `shouldBe` T E 1 (T E 2 E)
    it "insert to full branch" $
      insert2 4 (T (T E 1 E) 2 (T E 3 E)) `shouldBe` T (T E 1 E) 2 (T E 3 (T E 4 E))
    it "returns Nothing for inserting duplicated values" $
      insert2 1 (T E 1 E) `shouldBe` T E 1 E
    it "returns Nothing for inserting duplicated values in right branch" $
      insert2 2 (T E 1 (T E 2 E)) `shouldBe` T E 1 (T E 2 E)
    it "returns Nothing for inserting duplicated values in left branch" $
      insert2 1 (T (T E 1 E) 2 E) `shouldBe` T (T E 1 E) 2 E


  describe "insert3" $ do
    it "insert to empty tree" $
      insert3 1 E `shouldBe` T E 1 E
    it "insert to non-empty tree" $
      insert3 2 (T E 1 E) `shouldBe` T E 1 (T E 2 E)
    it "insert to full branch" $
      insert3 4 (T (T E 1 E) 2 (T E 3 E)) `shouldBe` T (T E 1 E) 2 (T E 3 (T E 4 E))
    it "returns Nothing for inserting duplicated values" $
      insert3 1 (T E 1 E) `shouldBe` T E 1 E
    it "returns Nothing for inserting duplicated values in right branch" $
      insert3 2 (T E 1 (T E 2 E)) `shouldBe` T E 1 (T E 2 E)
    it "returns Nothing for inserting duplicated values in left branch" $
      insert3 1 (T (T E 1 E) 2 E) `shouldBe` T (T E 1 E) 2 E
                

  describe "member" $ do
    it "return False when empty" $
      member 1 E `shouldBe` False
    it "return True when node contains value" $
      member 1 (T E 1 E) `shouldBe` True
    it "return True when right branch contains value" $
      member 2 (T E 1 (T E 2 E)) `shouldBe` True
    it "return True when left branch contains value" $
      member 1 (T (T E 1 E) 2 E) `shouldBe` True
    it "return False when right branch does not contain value" $
     member 3 (T E 1 (T E 2 E)) `shouldBe` False
    it "return False when left branch does not contain value" $
     member (-1) (T (T E 1 E) 2 E) `shouldBe` False

  describe "member2" $ do
    it "return False when empty" $
      member2 1 E `shouldBe` False
    it "return True when node contains value" $
      member2 1 (T E 1 E) `shouldBe` True
    it "return True when right branch contains value" $
      member2 2 (T E 1 (T E 2 E)) `shouldBe` True
    it "return True when left branch contains value" $
      member2 1 (T (T E 1 E) 2 E) `shouldBe` True
    it "return False when right branch does not contain value" $
      member2 3 (T E 1 (T E 2 E)) `shouldBe` False
    it "return False when left branch does not contain value" $
      member2 (-1) (T (T E 1 E) 2 E) `shouldBe` False

  describe "complete" $ do
    it "returns E when d = 0" $
      complete 1 0 `shouldBe` E
    it "returns T E 1 E when d = 1" $
      complete 1 1 `shouldBe` T E 1 E
    it "returns a tree which node is filled with 1 when d = 3" $
      complete 1 3 `shouldBe` T (T (T E 1 E) 1 (T E 1 E)) 1 (T (T E 1 E) 1 (T E 1 E))

  describe "balanced" $ do
    it "return E when n = 0" $
      balanced 1 0 `shouldBe` E
    it "return E when n = 1" $
      balanced 1 1 `shouldBe` T E 1 E
    it "return E when n = 2" $
      balanced 1 2 `shouldBe` T (T E 1 E) 1 E
    it "return E when n = 3" $
      balanced 1 3 `shouldBe` T (T E 1 E) 1 (T E 1 E)
    it "return E when n = 4" $
      balanced 1 4 `shouldBe` T (T (T E 1 E) 1 E) 1 (T E 1 E)
    it "return E when n = 5" $
      balanced 1 5 `shouldBe` T (T (T E 1 E) 1 E) 1 (T (T E 1 E) 1 E)
    it "return E when n = 6" $
      balanced 1 6 `shouldBe` T (T (T E 1 E) 1 (T E 1 E)) 1 (T (T E 1 E) 1 E)
    it "return E when n = 7" $
      balanced 1 7 `shouldBe` T (T (T E 1 E) 1 (T E 1 E)) 1 (T (T E 1 E) 1 (T E 1 E))