# metropolis.jl

# lattice = Array{Int8}(undef, 2, 2)
# random = rand([-1, 1], 3, 3)
# ground_state = ones(Int64, 3,3)
include("lattice_functions.jl")


#==================================================================
metropolis_hastings takes in:
	-max_iter: a max number of iterations to run the algorithm for
	-spins	 : an array consisting just of the numbers -1 and 1
and returns an array modified by the metropolis hastings algorithm.
===================================================================#

function metropolis(spins::Array{Int64}, T::Float64 = 1., max_iter::Int64 = 100)::Array{Int64}
	side_length = size(spins, 1)		#length of one side of square lattice
	energy = compute_energy(spins)
	for iterations in 1:max_iter
		i = rand(1:side_length)			#pick a random site on the lattice
		j = rand(1:side_length)
		new_spins = copy(spins)			#copy the lattice so we can compare old and new configs
		new_spins[i, j] *= -1			#flip the spin at the chosen site
		new_energy = compute_energy(new_spins)
		if rand() <= exp((energy - new_energy)/T)
			spins[i, j] *= -1
			energy = compute_energy(spins)
		end
	end
	return spins
end

# println(compute_energy(random))
# show(stdout, "text/plain", random)
# println("\n")
# println(compute_energy(ground_state, J, h), "\n")
# new = metropolis_hastings(50, random)
# println(compute_energy(new))
# show(stdout, "text/plain", new)


