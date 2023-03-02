local t = require(script.Parent.t)

local function onNilIndex(_self, key)
	key = tostring(key)
	error(("attempt to index nonexistent key: %s"):format(key), 2)
end

local function errorOnNilIndex(object)
	assert(t.table(object))
	local metatable = getmetatable(object) or {}
	if metatable.__index then
		error("object already has a custom index handler")
	else
		metatable.__index = onNilIndex
		setmetatable(object, metatable)
	end
	return object
end

local function deepErrorOnNilIndex(object, isDeep)
	if isDeep then
		for _key, value in pairs(object) do
			if typeof(value) == "table" then
				deepErrorOnNilIndex(value, true)
			end
		end
	end
	return errorOnNilIndex(object)
end

return deepErrorOnNilIndex