-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
-- fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Cargo en la bolsa data
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
-- Ordeno los registros 
sort = ORDER data BY letra;
-- Agrupo los registros 
letras = GROUP sort BY letra;
-- Cuento por letra
resultado = FOREACH letras GENERATE group, COUNT(sort);
-- Almaceno el resultado
STORE resultado INTO './output' using PigStorage('\t');
