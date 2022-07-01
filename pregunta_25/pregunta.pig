/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Se cargan los datos en una bolsa
A = LOAD 'data.csv' USING PigStorage(',') AS (Id:int, Name:chararray, Lastname:chararray, Date:datetime, Color:chararray, Quantity:int);
-- Se extraen los campos con los colores
B = FOREACH A GENERATE INDEXOF(Name,'a');
-- Almaceno el resultado en un archivo
STORE B INTO 'output' USING PigStorage(',');
