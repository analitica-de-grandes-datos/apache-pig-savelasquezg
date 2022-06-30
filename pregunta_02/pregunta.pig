/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
-- -- Cargo en la bolsa
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
-- Ordeno los registros por letra y por el número de la tercera columna
sort = ORDER data BY letra, numero;
-- Almaceno el resultado
STORE sort INTO './output' using PigStorage('\t');
