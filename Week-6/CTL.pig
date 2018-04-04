lines = LOAD 'sample' AS (line:chararray);

grouped = GROUP lines ALL;

countword = FOREACH grouped GENERATE COUNT(lines);

DUMP countword;

