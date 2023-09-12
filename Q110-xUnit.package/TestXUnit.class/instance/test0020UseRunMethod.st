tests
test0020UseRunMethod
"
Inspite of calling `testMethod` directly,
if we execute `run` method, it's nice to be called `testMethod` indirectly. 
(You can call `testMethod` directory in run method)

Please pass the test below on Playground.

```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test run.
Transcript show: test wasRun; cr
```

You will see nil<CR>1 on a Transcript.

https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/48a20612d7123cc90633bac61895b788069baf41/Q110-xUnit_work.package
"