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
   WHERE 
      color REGEXP '^[^b]';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
-- Se cargan los datos en una bolsa
A = LOAD 'data.csv' USING PigStorage(',') AS (Id:int, Name:chararray, Lastname:chararray, Date:datetime, Color:chararray, Quantity:int);
-- Se extraen los campos con los colores
B = FOREACH Ae GENERATE Name, Color;
-- Se filtra por colores que empiecen con B
C = FILTER B BY NOT STARTSWITH(Color,'b');
-- Almaceno el resultado en un archivo
STORE fC INTO 'output' USING PigStorage(',');
