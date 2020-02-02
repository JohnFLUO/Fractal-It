

# Introduction
Ce projet s'inscrit dans le cadre des projet de semestre 9 de l'option systèmes embarqués (SE) de la filière électronique de l'ENSEIRB-MATMECA. L'objectif est d'adapter sur plusieurs supports (CPU, GPU, FPGA) la fractale de Mandelbrot afin de réaliser un comparatif des diverses solution sur plusieurs critères : 
- vitesse d'affichage
- consommation énergétique
- coût du matériel
- temps de développement


# Implantation logicielle
## Convergence
L'implémentation C++ propose plusieurs modes de convergence :
- CPU
	- Flottant double précision
		- [x] Sans optimisation
		- [x] OpenMP
		- [x] OpenMP + AVX
		- [x] OpenMP + AVX entrelacé
	- Flottant simple précision
		- [x] Sans optimisation
		- [x]  OpenMP
		- [x]  OpenMP + AVX
		- [x]  OpenMP + AVX entrelacé
	- Virgule fixe
		- [x] Sans optimisation
		- [x] OpenMP
		- [X] OpenMP + SSE
- GPU
	- CUDA
		- [x] Simple précision
		- [x] Double précision 
	- OpenCL ?

# Implantation Matérielle
L'implantation matérielle se base sur deux approches :
- approche VHDL uniquement
- approche VHDL + modules issus de synthèse de haut niveau HLS.

