/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- Se cargan los datos en una bolsa
A = LOAD './data.csv' using PigStorage(',') AS (Id:int,  Name:chararray, Lastname:chararray,   Date:chararray,  Color:chararray, Quantity:int);
-- Se filtra
B = FILTER A BY SUBSTRING(Name,0,1) >= 'M';
-- Se extraen los campos con los nombres
C = FOREACH B GENERATE Name;
-- Almaceno el resultado en un archivo
STORE C INTO 'output/' using PigStorage(',');
