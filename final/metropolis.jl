# metropolis.jl

include("lattice_functions.jl")


#==================================================================
metropolis_hastings takes in:
	-spins	 : an array consisting just of the numbers -1 and 1
	-T		 : A temperature with default value 1.0
	-max_iter: a max number of iterations with default value 100

And returns an array modified by the metropolis hastings algorithm.
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


