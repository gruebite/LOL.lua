
local LOL = require("LOL")

-- To create a class, sublcass the root object "LOL" by calling `clone()`
local Animal = LOL:clone()

-- Class member.
Animal.FOO = 42

-- `init` is called manually, it is only convention that it returns itself.
function Animal:init(call)
  LOL.init(self)
  self.call = call
  return self
end

-- Simple function declarion.
function Animal:speak()
  return self.call
end

function Animal:__tostring() return "WOW" end

-- Subclass Animal the same as before.
local Dog = Animal:clone()

function Dog:init()
  return Animal.init(self, "bark!")
end

local Cat = Animal:clone()

function Cat:init()
  return Animal.init(self, "meow")
end

-- Instantiating can be done with new().
local dog = Dog:new()
assert(dog:speak() == "bark!")
-- ...or with clone():init()
local cat = Cat:clone():init()
assert(cat:speak() == "meow")

-- `isa` is a function on the root LOL object that returns true if a table is a subclass of a
-- class.
assert(dog:isa(Animal))
assert(dog:isa(Dog))
assert(not dog:isa(Cat))

assert(cat:isa(Animal))
assert(not cat:isa(Dog))
assert(cat:isa(Cat))

-- A bonus.
local Lion = Cat:clone()
function Lion:init()
    return Animal.init(self, "ROAR!!")
end

local lion = Lion:new()
assert(lion:speak() == "ROAR!!")

assert(lion:isa(Animal))
assert(not lion:isa(Dog))
assert(lion:isa(Cat))
assert(lion:isa(Lion))

print(tostring(lion))