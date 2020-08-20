# Cron Expression Parser 

When passed a string with cron values such as "*/15 0 1,15 * 1-5 /usr/bin/find" the program will expand each field to show the times it will run. 

### Issues

Does not handle if multiple modifiers are used, such as 1-15/5 for the minute. 
It would be better to generalise the code in the bulk of the program as it repeats itself (not DRY)
I could not get the tests to work using rspec. It might be better to write them in BATS?