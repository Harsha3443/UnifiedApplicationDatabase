-- =====================================================
-- Unified Application Database (UAD)
-- SQL Query Script
-- =====================================================


-- 1. Get all projects created by a specific user
SELECT 
    u.UserID,
    u.Name,
    p.ProjectID,
    p.ProjectName,
    p.CreatedAt
FROM dbo.[User] u
JOIN dbo.Project p
    ON u.UserID = p.UserID
WHERE u.UserID = 1;



-- 2. Get all routes under a specific project
SELECT
    p.ProjectName,
    r.RouteID,
    r.SourceLocation,
    r.DestinationLocation,
    r.Distance
FROM dbo.Project p
JOIN dbo.Route r
    ON p.ProjectID = r.ProjectID
WHERE p.ProjectID = 1;



-- 3. Get the latest cost entry for each route
SELECT rc.*
FROM dbo.RouteCost rc
JOIN (
    SELECT 
        RouteID,
        MAX(CalculatedAt) AS LatestTime
    FROM dbo.RouteCost
    GROUP BY RouteID
) latest
ON rc.RouteID = latest.RouteID
AND rc.CalculatedAt = latest.LatestTime;



-- 4. Calculate total cost per project
SELECT 
    p.ProjectID,
    p.ProjectName,
    SUM(rc.TotalCost) AS TotalProjectCost
FROM dbo.Project p
JOIN dbo.Route r ON p.ProjectID = r.ProjectID
JOIN dbo.RouteCost rc ON r.RouteID = rc.RouteID
GROUP BY p.ProjectID, p.ProjectName;




-- 5. Count number of experiments per dataset
SELECT
    d.DatasetName,
    COUNT(e.ExperimentID) AS ExperimentCount
FROM dbo.Dataset d
LEFT JOIN dbo.Experiments e
    ON d.DatasetID = e.DatasetID
GROUP BY d.DatasetName;



-- 6. Get best experiment per dataset (highest accuracy)
SELECT
    d.DatasetName,
    e.ExperimentID,
    e.ModelName,
    m.MetricValue
FROM dbo.Dataset d
JOIN dbo.Experiments e
    ON d.DatasetID = e.DatasetID
JOIN dbo.Metric m
    ON e.ExperimentID = m.ExperimentID
WHERE m.MetricName = 'accuracy'
AND m.MetricValue = (
    SELECT MAX(m2.MetricValue)
    FROM dbo.Metric m2
    JOIN dbo.Experiments e2
        ON m2.ExperimentID = e2.ExperimentID
    WHERE e2.DatasetID = d.DatasetID
      AND m2.MetricName = 'accuracy'
);



-- 7. Get all metrics for a specific experiment
SELECT
    e.ExperimentID,
    e.ModelName,
    m.MetricName,
    m.MetricValue,
    m.RecordedAt
FROM dbo.Experiments e
JOIN dbo.Metric m
    ON e.ExperimentID = m.ExperimentID
WHERE e.ExperimentID = 1;

