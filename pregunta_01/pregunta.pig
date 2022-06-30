-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- Cargo en la bolsa data los registros
data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
-- Ordeno los registros por la letra de la primera columna
sort = ORDER data BY letra;
-- Agrupo los registros por letra
letras = GROUP sort BY letra;
-- Y hago un conteo por letra
resultado = FOREACH letras GENERATE group, COUNT(sort);
-- Almaceno el resultado en un archivo
STORE resultado INTO './output' using PigStorage('\t');