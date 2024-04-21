INSERT INTO Walmart_SMA (Timestamp, SMA)
SELECT
    key::TIMESTAMP AS Timestamp,
    (value->>'SMA')::NUMERIC(10, 4) AS SMA   
FROM
    RawData4,
    jsonb_each(raw_json->'Technical Analysis: SMA') AS timeseries(key, value)
ON CONFLICT (Timestamp)
DO NOTHING;
