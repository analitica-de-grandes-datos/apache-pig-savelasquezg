/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

A = LOAD 'data.csv' USING PigStorage(',') AS (Id:int, Name:chararray, Lastname:chararray, Date:datetime, Color:chararray, Quantity:int);

B = FOREACH A GENERATE Name, Color;
C = FILTER B BY Color == 'blue' AND STARTSWITH(Name,'Z');
D = FOREACH C GENERATE CONCAT(Name,' ',Color);

STORE D INTO 'output' USING PigStorage(',');

