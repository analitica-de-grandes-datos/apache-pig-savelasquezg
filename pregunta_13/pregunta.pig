/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
-- Se cargan los datos en una bolsa
A = LOAD './data.csv' using PigStorage(',') AS (ID:int, Name:chararray, Lastname:chararray, Date:chararray, Color:chararray, Quantity:int);
-- Se extraen los campos con los colores
B = FOREACH A GENERATE Color;
-- Se filtra por colores que empiecen con B
C = FILTER B BY ($0 matches '.*b.*');
DUMP B;
-- Almaceno el resultado en un archivo
STORE C INTO 'output/' using PigStorage(',');
