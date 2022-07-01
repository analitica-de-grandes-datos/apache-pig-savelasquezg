/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Se cargan los datos en una bolsa
A = LOAD './data.tsv' AS (letter:chararray, setTuplesLetters:bag{}, arrayLetters:map[]);
-- Se toma la letra de la primera columna, y el número de registros de las columnas 2 y 3
B = FOREACH A GENERATE letter, (int)COUNT(setTuplesLetters) AS totalCol2 , (int) SIZE(arrayLetters) AS totalCol3;
-- Se ordenan los registros por cada columna
C = ORDER B BY letter, totalCol2, totalCol3;
-- Almaceno el resultado en un archivo
STORE C INTO 'output/' using PigStorage(',');
