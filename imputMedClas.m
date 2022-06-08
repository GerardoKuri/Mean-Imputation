%Función que recibe un arreglo de datos con datos faltantes = 0
%Devuelve el arreglo imputado por medio de media de clases clasificandolos
%entre excedencias y no excedencias
function arr=imputMedClas(arr)
    Exc=round(mean(arr(arr>50)));
    noExc=round(mean(arr(arr<=50)));
    for i=4:size(arr,2)
        if arr(i)==0
            M=mean([arr(i-1) arr(i-2) arr(i-3)]);
            if M>50
                arr(i)=Exc;
            else
                arr(i)=noExc;
            end
        end
    end
end