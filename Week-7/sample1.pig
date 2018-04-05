
Lines= LOAD 'movieLensFile' AS (line: chararray); 

Words = FOREACH Lines GENERATE FLATTEN (TOKENIZE (line)) AS word;

Groups = GROUP Words BY word;

Counts = FOREACH Groups GENERATE group, COUNT (Words);

Results = ORDER Counts BY $1 DESC;

Top5 = LIMIT Results 5;

STORE Top5 INTO '/user/hduser/chintam/output3';
