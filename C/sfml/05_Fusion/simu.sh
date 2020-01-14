
if [ $# -eq 0 ]
then
	echo "\033[31mSelectionner un type de convergence !" #rouge
	echo "\033[36mex : sh simu.sh --dp_omp_avx++ \033[0m" #cyan
else
	./bin/fractal auto_zoom1 --nbsimu 10 $1 --save --close --testID 1 --first
	./bin/fractal auto_zoom2 --nbsimu 10 $1 --save --close --testID 2
	./bin/fractal auto_zoom3 --nbsimu 10 $1 --save --close --testID 3
	./bin/fractal auto_zoom4 --nbsimu 10 $1 --save --close --testID 4
	./bin/fractal auto_zoom5 --nbsimu 10 $1 --save --close --testID 5
	./bin/fractal auto_zoom6 --nbsimu 10 $1 --save --close --testID 6
	./bin/fractal auto_zoom7 --nbsimu 10 $1 --save --close --testID 7 
	./bin/fractal auto_zoom8 --nbsimu 10 $1 --save --close --testID 8 --last
fi