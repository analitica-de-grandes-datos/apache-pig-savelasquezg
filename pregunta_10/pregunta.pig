/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Se cargan los datos en una bolsa
data_table = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Id:int,
        Name:chararray,
        Lastname:chararray,
        Date:datetime,
        Color:chararray,
        Quantity:int
    );
-- Se filtran los apellidos y se genera su longitud
specific_columns = FOREACH data_table GENERATE Lastname , SIZE(Lastname) AS tamano;
-- Se ordena por longitud y por apellido
columns_order = ORDER specific_columns BY tamano desc, Lastname 
-- Y se imprimen los primeros 5 registros
limit_output = LIMIT columns_order 5;
-- Almaceno el resultado en un archivo
STORE limit_output INTO 'output' USING PigStorage(',');
