require 'bundler'
Bundler.require

require_all 'lib'

WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
]

VALID_INPUT_RANGE = 0..8

TLC = 0 
TS = 1
TRC = 2 
MLS = 3 
MC = 4 
MRS = 5 
BLC = 6 
BS = 7 
BRC = 8 