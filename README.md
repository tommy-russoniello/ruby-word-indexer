# ruby-word-indexer
Simple Ruby script for counting and indexing words in text files.

---

## Example Usage
Say we have 2 text files:

test1.txt
```
This is the first test file....
TomORroW it will be 35°F. 5 #$%$ . the
```

test2.txt
```
!!! This is the second test file. test test.
```

and we run `ruby indexer.rb test1.txt test2.txt`, we will get the following output:

```
'test' is mentioned 4 times at indexes
  1-5, 2-5, 2-7, 2-8

'the' is mentioned 3 times at indexes
  1-3, 1-13, 2-3

'file' is mentioned 2 times at indexes
  1-6, 2-6

'is' is mentioned 2 times at indexes
  1-2, 2-2

'this' is mentioned 2 times at indexes
  1-1, 2-1

'35f' is mentioned 1 time at index
  1-11

'5' is mentioned 1 time at index
  1-12

'be' is mentioned 1 time at index
  1-10

'first' is mentioned 1 time at index
  1-4

'it' is mentioned 1 time at index
  1-8

'second' is mentioned 1 time at index
  2-4

'tomorrow' is mentioned 1 time at index
  1-7

'will' is mentioned 1 time at index
  1-9
```
