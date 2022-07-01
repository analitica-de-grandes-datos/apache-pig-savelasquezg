/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
--Cargar
A = LOAD 'data.tsv'
    AS (fl1:CHARARRAY, fl2:BAG{t: TUPLE(p:CHARARRAY)}, fl3:MAP[]);
--Filtro
B = FOREACH A GENERATE fl2, fl3;
C = FOREACH B GENERATE FLATTEN(fl2),FLATTEN(fl3);
-- Agrupar
D = GROUP C BY ($0, $1);
--Conteo
E = FOREACH D GENERATE group , COUNT($1);
DUMP E;
-- Almacenar
STORE E INTO 'output/' using PigStorage(',') ;
