# error-on-nil-index

Throws an error when a nonexistent table index is attempted to be located. Useful for tables of constants and settings. Returns the exact same table passed in.

```
table errorOnNilIndex(table targetTable, bool shouldApplyToEntireTree)
```

```lua
local errorOnNilIndex = require(script.Parent.errorOnNilIndex)

local myTable = {
	Setting1 = "Hi";
	Setting2 = "Hello!";
	RandomList = {
		test = "hi";
	};
}

errorOnNilIndex(myTable)

print(myTable.RandomList.test2) -- does not throw an error
print(myTable.Setting3) -- throws an error

local myTable2 = {
	Setting1 = "Hi";
	RandomList = {
		test = "hi";
	};
}

errorOnNilIndex(myTable2, true)

print(myTable.RandomList.test2) -- throws an error
```
