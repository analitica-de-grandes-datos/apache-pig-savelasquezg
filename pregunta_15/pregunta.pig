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

  /* >>> Escriba su respuesta a partir de este punto <<< */
-- Se cargan los datos en una bolsa
A = LOAD 'data.csv' USING PigStorage(',') AS (Id:int, Name:chararray, Lastname:chararray, Date:datetime, Color:chararray, Quantity:int);
-- Se extraen los campos con los nombres y colores
B = FOREACH Name GENERATE Name, Color;
-- Se filtra 
C = FILTER A BY Color == 'blue' AND STARTSWITH(Name,'Z');
D = FOREACH C GENERATE CONCAT(Name,' ',Color);
-- Almaceno el resultado en un archivo
STORE D INTO 'output' USING PigStorage(',');
