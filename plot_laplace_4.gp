
# Tracés gnuplot avec styles de lignes perso

# Output dans un fichier pdf
set terminal pdfcairo enhanced color font "Arial, 12" linewidth 2 fontscale 1.0 \
    size 10,6 # inches

#set term postscript eps enhanced color linewidth 2 font "Arial, 12"
#    size 10,6 # inches

# Styles de ligne pour les axes
set style line 100 lw 2 lt rgb "#808080" # grey

# Style de ligne pour la grille
set style line 101 lt 0             # dashed
set style line 101 lt rgb "#808080" # grey

set grid back linestyle 101

set border 3 back linestyle 100 # Remove border on top and right.  These
             # borders are useless and make it harder
             # to see plotted lines near the border.
	     # Also, put it in grey; no need for so much emphasis on a border.

set xtics nomirror
set ytics nomirror

set logscale xy
set mxtics 10    # Makes logscale look good.
set mytics 10    # Makes logscale look good.

# Line styles: try to pick pleasing colors, rather
# than strictly primary colors or hard-to-see colors
# like gnuplot's default yellow.  Make the lines thick
# so they're easy to see in small plots in papers.
set style line 1 lt rgb "#DB0000" lw 2 # m Rouge
set style line 2 lt rgb "#00009E" lw 2 # f Bleu foncé
set style line 3 lt rgb "#00994D" lw 2 # x1 Vert
set style line 4 lt rgb "#F25900" lw 2 # h dashed Orange
set style line 5 lt rgb "#DB006E" lw 2 # j Rouge rose
set style line 6 lt rgb "#7ACAFF" lw 2 # d Bleu clair
set style line 7 lt rgb "#FF66FF" lw 2 # Rose

set xlabel "Tolérance"
set ylabel "erreur relative"
set title "Equation de Laplace avec u(x,y)=x*y*(1-x)*(1-y)"
set key outside

set output "output4/laplace_errors_umfpack.pdf"
plot [1.0e-14:0.2] \
    "output4/laplace4_errors_umfpack.txt" u 1:2 w lp ls 1 t 'Norme L^2 UMFPACK',\
    "output4/laplace4_errors_umfpack.txt" u 1:4 w lp ls 2 t 'Norme L^2 GC' , \
    "output4/laplace4_errors_umfpack.txt" u 1:6 w lp ls 3 t 'Norme L^2 GMRES'

set output "output4/laplace_cpu.pdf"
set ylabel "temps (s)"
set key outside
plot [1.0e-14:0.2] \
     "output4/laplace4_errors_umfpack.txt" u 1:3 w lp ls 1 t 'temps CPU -- UMFPACK',\
     "output4/laplace4_errors_umfpack.txt" u 1:5 w lp ls 2 t 'temps CPU -- GC',\
     "output4/laplace4_errors_umfpack.txt" u 1:7 w lp ls 3 t 'temps CPU -- GMRES'
