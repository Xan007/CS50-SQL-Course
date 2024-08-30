-- Get the districts name with their percentaje of needing improvement and unsatisfactory
-- that needs more improvement than the average
SELECT "name", "needs_improvement", "unsatisfactory"
FROM "districts"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "needs_improvement" > (
    SELECT AVG("needs_improvement")
    FROM "staff_evaluations"
)
ORDER BY "needs_improvement" DESC, "unsatisfactory" DESC;
