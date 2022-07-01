/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- Se cargan los datos en una bolsa
A = LOAD './data.csv' using PigStorage(',') AS (Id:int,  Name:chararray, Lastname:chararray,   Date:chararray,  Color:chararray, Quantity:int);
-- Se extraen los campos con los nombres
B = FOREACH A GENERATE INDEXOF(Name, 'ia');
-- Almaceno el resultado en un archivo
STORE B INTO 'output/' using PigStorage(',');
