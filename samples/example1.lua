luafft = require "luafft"

local list1 = {}
local size = 2048

--Populates a list with random real numbers in complex format
function populate(list)
  for i=1,size do
	  list[i] = complex.new(math.random(), 0)
  end
end

--displays a comparison of two lists with complex numbers
function compare(one, two)
  for i=1,#one do print(string.format("1: %s\t2: %s\n", tostring(one[i]),tostring(two[i]))) end
end

--displays a single list with whatever it contains
function print_list(list)
  for i,v in ipairs(list) do print(i,v) end
end

--devide a list with a certain constant factor
function devide(list, factor)
  for i,v in ipairs(list) do list[i] = list[i] / factor end
end

--create a list with random real values
populate(list1)

--carry out fast fourier transformation and store result in "ret"
ret = fft(list1, false)

--now carry out inverse fast fourier transformation and store result in "ret2"
ret2 = fft(ret, true)

--After retransformation, we need to devide by the data size
devide(ret2, size)

--displays a comparison of the input and the output, the real part should be equal
--the imaginary part is non zero (but fairly close) due to several calculations
--that have been carried out in the FFT
compare(list2,ret)

