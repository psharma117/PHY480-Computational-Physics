# lol = Array{Int64, 2}(undef, 2, 1)
# lol = Vector{Int64}[[1, 3]]
# lol = Matrix{Int64, 2}([ 0, 2 ])
lol = [ [0, 2] ]

print(lol)
print("\n")

test = vcat(lol, [ [4, 3] ])
test = vcat(test, [ [5, 4] ])
println(test)
for row in test
	println(row)
	print(row[1], " ")
	println(row[2])
end

