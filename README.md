# error-on-nil-index

Throws an error when a nonexistent table index is attempted to be located. Useful for tables of constants and settings.

```lua
local errorOnNilIndex = require(script.Parent.errorOnNilIndex)

local myTable = {
	Setting1 = "Hi";
	Setting2 = "Hello!";
}

errorOnNilIndex(myTable)

print(myTable.Setting3) -- throws an error
```
