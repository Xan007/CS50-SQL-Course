SELECT MAX("contrast") AS "Maximum Contrast" FROM "views" WHERE "artist" = 'Hokusai';

-- Does Hokusai’s prints most contrasting print actually have much contrast?
-- Hokusai’s most contrasting print has a contrast value of 0.65, which is notably higher
-- than the average contrast of 0.4625. Thus, it has much contrast compared to his other prints.

-- Average query: SELECT AVG("contrast") FROM "views" WHERE "artist" = 'Hokusai';
