-- Boolean Type
local boolean1 = true
local boolean2 = false

-- Number Type
local number1 = 0
local number2 = -10
local number3 = 5.2

-- String Type
local string1 = "Hello"
local string2 = "World"

-- Function Type
local f1 = function(x) 
  return x * 50
end

local result = f1(50)
print(result)

-- Table Type
local t1 = {}
t1.bool = true
t1.num = 2.5
t1.str = "abc"
t1.func = function(x)
  return x * 2
end
print("printing t1 values")
print(t1.bool)
print(t1.num)
print(t1.str)
print(t1.func(2))

-- Tables like an Array
local nums = {2, 4, 6, 8}
print("printing nums values")
print(nums[1])
print(nums[2])
print(nums[3])
print(nums[4])

-- Tables Within Tables Example
local t2 = {}
t2.table = {}
t2.table.num = 10
print("printing t2's table.num")
print(t2.table.value)

-- Branching
a = false
b = false
if a and b then
  print("a and b are true.")
elseif a or b then
  print("a or b are true.")
else
  print("neither a or b are true.")
end

-- Loops
local i = 1
while(i <= 10) do
  print(i)
  i = i + 1
end

for i = 1, 10 do
  print(i)
end

for i = 1, 10, 2 do
	print(i)
end



