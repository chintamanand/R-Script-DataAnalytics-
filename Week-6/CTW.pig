lines = LOAD 'sample' AS (line:chararray);

words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;

grouped = GROUP words ALL;

unique = DISTINCT grouped;

countword = FOREACH unique GENERATE COUNT(words);

DUMP countword;
