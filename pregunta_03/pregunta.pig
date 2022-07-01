/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Cargo en la bolsa data los registros
A = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);
-- Ordeno los registros por la tercera columna
B = ORDER A BY amount;
-- Se extraen los 5 registros
C = limit B 5;
-- Filtro la columna "numero" en una nueva bolsa
D = FOREACH C GENERATE amount;

-- Almaceno el resultado en un archivo
STORE D INTO 'output/' using PigStorage(',');
