/* 
Pregunta
===========================================================================
Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 
Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:
$ pig -x local -f pregunta.pig
        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);

sort = ORDER data BY letra;

letras = GROUP sort BY letra;

resultado = FOREACH letras GENERATE group, COUNT(sort);

STORE resultado INTO './output' using PigStorage('\t');
