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
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
-- Se cargan los datos en una bolsa
A = LOAD './data.csv' using PigStorage(',') AS (ID:int, Name:chararray, Lastname:chararray, Date:chararray, Color:chararray, Quantity  :int);
-- Se extraen los campos con los nombres y colores
B = FOREACH A GENERATE Name, Color;
-- Se filtra por 
C = FILTER B BY NOT (Color  MATCHES '.*b.*');
DUMP B;
-- Almaceno el resultado en un archivo
STORE C INTO 'output/' using PigStorage(',') ;

