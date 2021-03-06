-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.Ordinal.CA.Corpus
  ( corpus ) where

import Data.String
import Prelude

import Duckling.Locale
import Duckling.Ordinal.Types
import Duckling.Resolve
import Duckling.Testing.Types

corpus :: Corpus
corpus = (testContext {locale = makeLocale ES Nothing}, testOptions, allExamples)

allExamples :: [Example]
allExamples = concat
  [ examples (OrdinalData 1)
             [ "primer"
             , "primera"
             , "primers"
             , "primeres"
             ]
  , examples (OrdinalData 2)
             [ "segon"
             , "segona"
             , "segons"
             , "segones"
             ]
  , examples (OrdinalData 10)
             [ "desè"
             , "desena"
             , "desens"
             , "desenes"
             ]
  ]
