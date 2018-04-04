titanic = LOAD 'lab6_1' USING PigStorage(',');

lastcol = foreach titanic generate (chararray) $8;

DUMP lastcol;
