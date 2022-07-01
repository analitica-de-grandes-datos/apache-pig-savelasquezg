/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Se cargan los datos en una bolsa
data_table = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        col1:chararray,
        col2:BAG{dict:TUPLE(letter:chararray)},
        col3:MAP[]
    );
-- Filtro la información por la segunda columna
specific_columns = FOREACH data_table GENERATE col2;
words = FOREACH specific_columns GENERATE FLATTEN(col2) AS word;
-- Se agrupan los datos filtrados
grouped = GROUP words BY word;
-- Y se realiza el conteo por letra
wordcount = FOREACH grouped GENERATE group, COUNT(words);
-- Almaceno el resultado en un archivo
STORE wordcount INTO 'output' USING PigStorage(',');
