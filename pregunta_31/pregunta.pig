/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- Se cargan los datos en una bolsa
A = LOAD './data.csv' using PigStorage(',') AS (Id:int,  Name:chararray, Lastname:chararray,   Date:chararray,  Color:chararray, Quantity:int);
-- Se extraen los campos
B = FOREACH A GENERATE SUBSTRING(Date, 0, 4) AS yearBirthday;
--Se agrupa por fecha
C = GROUP B BY yearBirthday;
-- Se cuenta
D = FOREACH C GENERATE $0, COUNT($1);
-- Almaceno el resultado en un archivo
STORE D INTO 'output/' using PigStorage(',');
