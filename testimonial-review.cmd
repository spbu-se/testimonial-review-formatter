set here=%~dp0
set src=%1
set basename=%~n1
set srcdir=%~dp1

set tex=%basename%.tex
set txt=%basename%.txt
set pdf=%basename%.pdf

set unihere=%here:\=/%

pandoc -t latex -o "%tex%" --template "%here%\templates\testimonial.latex" "%src%"
pandoc -t plain -o "%txt%" --template "%here%\templates\testimonial.plain" "%src%"

move "%tex%" "%here%"
pushd "%here%"
tectonic "%tex%"
del "%tex%"
move "%pdf%" "%srcdir%"
popd
