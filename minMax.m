%Funci�n que recibe un arreglo de n�meros enteros
%Devuelve el arreglo normalizado por medio de min max
function arr=minMax(arr)
m=min(arr);
M=max(arr);
R=(M-m);
arr=(arr./R);
end