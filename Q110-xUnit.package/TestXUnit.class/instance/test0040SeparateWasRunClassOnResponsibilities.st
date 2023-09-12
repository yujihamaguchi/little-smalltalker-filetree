tests
test0040SeparateWasRunClassOnResponsibilities
"
You should separate `WasRun` class based on responsibilities.

1. Recording whether a method has been executed -> WasRun class
2. Dynamically invoking a test method -> TestCaze class


Please pass the test below on Playground.
( Same as the previous test )
```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test run.
Transcript show: test wasRun; cr
```

You will see nil<CR>1 on a Transcript.

https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/ad9c97479f630731adce20d5fe5bc66636790343/Q110-xUnit_work.package
"