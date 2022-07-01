/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Se cargan los datos en una bolsa
A = LOAD './data.csv' using PigStorage(',') AS (id:int,  Name:chararray, Lastname:chararray,   Date:chararray,  Color:chararray, Quantity:int);
-- Se filtran los apellidos y se genera su longitud
B = FOREACH A GENERATE UCFIRST(Lastname), UPPER(Lastname), LOWER(Lastname);
-- Se ordenan los registros
C = ORDER B BY $0;
-- Almaceno el resultado en un archivo
STORE C INTO 'output/' using PigStorage(',');
