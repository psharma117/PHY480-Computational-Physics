# Getting set up: Julia

If you want to run any of my code and don't already have Julia installed, it can be found [here](https://julialang.org/downloads/). I'm using the latest stable version by default.

Julia has a package manager that's accessed within its prompt, which is started by just typing `julia` in the terminal just like with `python` and `gnuplot`. For this project, the only external package I used was `Plots` with the `gr` backend. To install `Plots.jl`, see the following example prompt (of course in my case it just reports no changes made as they're already installed):

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.6.0 (2021-03-24)
 _/ |\__'_|_|_|\__'_|  |  release-1.6/f9720dc2eb* (fork: 291 commits, 140 days)
|__/                   |

julia> import Pkg

julia> Pkg.add("Plots")
    Updating registry at `~/.julia/registries/General`
   Resolving package versions...
  No Changes to `~/.julia/environments/v1.6/Project.toml`
  No Changes to `~/.julia/environments/v1.6/Manifest.toml`

julia> Pkg.add("GR")
   Resolving package versions...
  No Changes to `~/.julia/environments/v1.6/Project.toml`
  No Changes to `~/.julia/environments/v1.6/Manifest.toml`

julia>


```
# My work

I wrote all of my code myself. I implemented the standard Metropolis Hastings algorithm in [`metropolis.jl`](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/final/metropolis.jl) and the Wolff Cluster algorithm in [`wolff_cluster.jl`](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/final/wolff_cluster.jl). For my analysis (and briefly in the Metropolis implementation), I used the functions in `lattice_functions.jl`

I do my main discussion in `ising.ipynb` which is a standard Jupyter Notebook with a Julia kernel instead of a Python kernel.

