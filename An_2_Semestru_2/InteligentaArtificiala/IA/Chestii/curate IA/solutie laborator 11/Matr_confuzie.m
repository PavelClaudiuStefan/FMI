function eroareMisclasare = calculeazaEroareMisclasare(T1,T2)

eroareMisclasare = sum(sum(abs(T1-T2))/2)/size(T1,2);