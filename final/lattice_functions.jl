#=================================================================
compute_energy takes in:
        -J    : the nearest-neighbor coupling between spins
        -h    : the combination of B field and magnetic moment
        -spins: the array of spin values, 1 and -1
to compute the total energy of a given configuration.
==================================================================#

function compute_energy(spins::Array{Int64}, J::Float64 = 1., h::Float64 = 0.)::Float64
	side_length = size(spins, 1)            #length of one side of square lattice
	energy = 0
	for i in 1:(side_length - 1)            #adding the (side_length - 1) "bonds" in each direction
		for j in 1:(side_length - 1)
			energy -= J*(spins[i, j]*spins[i, j+1] + spins[i, j]*spins[i+1, j]) 
		end
		energy -= J*spins[side_length, i]*spins[side_length, i+1]
		energy -= J*spins[i, side_length]*spins[i+1, side_length]
	end
	energy -= h*sum(spins)                          #Adding external field contribution
	return energy
end


function compute_magnetization(spins::Array{Int64})::Float64
	side_length = size(spins, 1)
	return abs(sum(spins))/(side_length^2)
end


