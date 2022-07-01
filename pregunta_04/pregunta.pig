/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
-- Cargo en la bolsa data los registros
A = LOAD './data.csv' using PigStorage(',') AS (driverId:int, truckId:int, eventTime:chararray, eventType:chararray, longitude:double, latitude:double, eventKey:chararray, correlationId:chararray, driverName:chararray,routeId:biginteger,routeName:chararray, eventDate:chararray );
-- Se hace un filtro por los primeros 10 registros
B = limit A 10;
-- Se crea una nueva bolsa con las primeras 3 columnas
C = FOREACH B GENERATE driverId,truckId,eventTime;
-- Se ordena por todas las columnas y se entrega el resultado
D = ORDER C BY driverId,truckId,eventTime;
-- Almaceno el resultado en un archivo
STORE D INTO 'output/' using PigStorage(',');
