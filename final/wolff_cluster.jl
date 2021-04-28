#wolff_cluster

const J = 1.
lattice = rand([-1, 1], 100, 100)
# show(stdout, "text/plain", lattice)
# println("How many iterations? Press enter to do 100")
# iters = readline()
# println("What temperature (J=1)? Press enter for T = 1.5")
# temp  = readline()
# if isempty(iters)
	# iters = 100
# else
	# iters = parse(Int64, iters)
# end
# if isempty(temp)
	# temp = 1.5
# else
	# temp = parse(Float64, temp)
# end

function wolff(spins::Array{Int64}, T::Float64 = 1.5, max_iter::Int64 = 100)
	side_length = size(spins, 1)

	#We'll perform max_iter iterations of this algorithm, which means picking 
	#max_iter starting sites and trying to make max_iter clusters
	for iterations in 1:max_iter
		start_i = rand(1:side_length)
		start_j = rand(1:side_length)

		#I'm going to store the "coordinates" of each relevant site on the 
		#lattice as 2D arrays, so I define cluster and boundary as single
		#element vectors carrying 2D vectors
		cluster = [[start_i, start_j]]
		boundary = [[start_i, start_j]]

		#The boundary is to be updated with new sites that are probabilistically
		#accepted. If no new sites are accepted, the boundary will updated to be
		#empty, meaning the cluster formation is complete. 
		while !isempty(boundary)
			new_boundary = []
			#For every site in the boundary, the neighbors are the 4 adjacent spins
			# for site in boundary
			Threads.@threads for site in boundary
				neighbors = [[site[1] + 1, site[2]],
							 [site[1] - 1, site[2]],
							 [site[1], site[2] + 1],
							 [site[1], site[2] - 1]]

				#Because I'm arranging the neighbors array in a known manner, I can
				#account for sites at the edge of the lattice in a straightforward
				#manner: just delete the relevant element from neighbors
				if site[2] == side_length 
					deleteat!(neighbors, 3)
				elseif site[2] == 1
					deleteat!(neighbors, 4)
				end

				if site[1] == side_length 
					deleteat!(neighbors, 1)
				elseif site[1] == 1
					deleteat!(neighbors, 2)
				end

				#For every neighbor out of the nearest neighbors, add a neighbor to
				#the cluster with probability 1 - exp(-2J/T) if the spins are the 
				#same and the neighbor isn't in the cluster
				Threads.@threads for neighbor in neighbors
					if !(neighbor in cluster) && 
						spins[neighbor[1], neighbor[2]] == spins[site[1], site[2]] &&
						rand() <= 1 - exp(-2*J/T)

						#vcat concatenates the 2nd argument "vertically" to the 1st
						new_boundary = vcat(new_boundary, [neighbor])
						cluster = vcat(cluster, [neighbor])
					end
				end
			end
			#update the boundary based on the changes we've made
			boundary = copy(new_boundary)
		end
		
		#Flip the spin of every site in the cluster
		Threads.@threads for site in cluster
			spins[site[1], site[2]] *= -1
		end
	end
	open("spins.dat", "w") do out
		show(out, "text/plain", spins)
	end
	return spins
end

# @time wolff(lattice, temp, iters)

# run(`python plot.py`)

