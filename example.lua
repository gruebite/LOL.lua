
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

-- Subclass Animal the same as before.
local Dog = Animal:clone()

function Dog:init()
  return Animal.init(self, "bark!")
end

local Cat = Animal:clone()

function Cat:init()
  return Animal.init(self, "meow")
end

-- Instantiating also requires a call to clone, but with an added manual call to init.
local dog = Dog:clone():init()
assert(dog:speak() == "bark!")
local cat = Cat:clone():init()
assert(cat:speak() == "meow")

-- `is` is a function on the root LOL object that returns true if a table is an exact instance of
-- a class.
assert(not dog:is(Animal))
assert(dog:is(Dog))
assert(not dog:is(Cat))

assert(not cat:is(Animal))
assert(not cat:is(Dog))
assert(cat:is(Cat))

-- `issub` is a function on the root LOL object that returns true if a table is a subclass of a
-- class.
assert(dog:issub(Animal))
assert(dog:issub(Dog))
assert(not dog:issub(Cat))

assert(cat:issub(Animal))
assert(not cat:issub(Dog))
assert(cat:issub(Cat))

-- A bonus.
local Lion = Cat:clone()
function Lion:init()
    return Animal.init(self, "ROAR!!")
end

local lion = Lion:clone():init()
assert(lion:speak() == "ROAR!!")

assert(not lion:is(Animal))
assert(not lion:is(Dog))
assert(not lion:is(Cat))
assert(lion:is(Lion))
assert(lion:issub(Animal))
assert(not lion:issub(Dog))
assert(lion:issub(Cat))
assert(lion:issub(Lion))
