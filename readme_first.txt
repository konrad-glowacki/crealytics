------
During support we sometimes write some quickfix solutions, which we think will not be needed apart from that one time task. Thus the code usually has no tests, is not documented and just everything in one large file. Attached you find an example for such an assumed one time task - modifier.rb.

I'd like you to do the following:
- give me a short explanation of what the code actually does.
- refactor the code and ensure that the refactored code does the same
  as before.
- create a git repository containing the initial files and do regular
  and small commits to log your process.
- send me your git bundle containing your changes.
------

------
What the code does:
- take the newest txt file matching with the name put in argument
- save a new sorted file by values in 'Clicks' column (descending)
- combine sorted list by "Keyword Unique ID" (in all cases will return the same list beacuse in arguments puts only one enumerator)
- change values for columns "number of commissions", "Commission Value", "ACCOUNT - Commission Value", "CAMPAIGN - Commission Value", "BRAND - Commission Value", "BRAND+CATEGORY - Commission Value", "ADGROUP - Commission Value", "KEYWORD - Commission Value" depends on variables modification_factor and cancellaction_factor
- save list with the new values into new file (with max 120000 lines, if has more will create another file with incremented index)
------
