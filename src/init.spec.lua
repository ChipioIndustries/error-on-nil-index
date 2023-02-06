return function()
	local errorOnNilIndex = require(script.Parent)
	describe("errorOnNilIndex", function()
		it("should return the table it received", function()
			local testTable = {}
			local result = errorOnNilIndex(testTable)
			expect(result).to.equal(testTable)
		end)
		it("should throw error on indexing nil", function()
			local testTable = {}
			errorOnNilIndex(testTable)
			expect(function()
				local _test = testTable.nonexistentKey
			end).to.throw()
		end)
		it("should allow regular indexes", function()
			local testTable = {
				testValue = 5;
			}
			errorOnNilIndex(testTable)
			expect(testTable.testValue).to.equal(5)
		end)
		it("should not accept objects with index handlers", function()
			local object = {}
			local metatable = {}
			metatable.__index = {}
			setmetatable(object, metatable)
			expect(function()
				errorOnNilIndex(object)
			end).to.throw()
		end)
		it("should not accept non-table object", function()
			expect(function()
				errorOnNilIndex(nil)
			end).to.throw()
			expect(function()
				errorOnNilIndex(1234)
			end).to.throw()
			expect(function()
				errorOnNilIndex(Instance.new("ObjectValue"))
			end).to.throw()
		end)
	end)
end