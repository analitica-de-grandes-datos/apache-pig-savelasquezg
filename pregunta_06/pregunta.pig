/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- Se cargan los datos en una bolsa
A = LOAD './data.tsv' AS (letter:chararray, bagArray:chararray, M:map [] );
-- Filtro la información por la tercera columna
B = FOREACH A GENERATE M;
C = FOREACH B GENERATE FLATTEN(M);
-- Se agrupan los datos filtrados
D = GROUP C BY $0;
-- Y se realiza el conteo por código
E = FOREACH D GENERATE group, COUNT($1);
-- Almaceno el resultado en un archivo
STORE E INTO 'output/' using PigStorage(',');
