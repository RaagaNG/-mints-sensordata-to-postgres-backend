/*
    From now on, the master database should be the main source for table format. 
    This file will eventually be deleted but remains in commits for a paper trail as there have been changes.
*/
CREATE TABLE IF NOT EXISTS data_pm1 (
    timestamp TIMESTAMP,
    sensor_id VARCHAR(20),
    value double precision,
    longitude double precision,
    latitude double precision,
    humidity double precision,
    temperature double precision
);

CREATE TABLE IF NOT EXISTS data_pm2_5 (
    timestamp TIMESTAMP,
    sensor_id VARCHAR(20),
    value double precision,
    longitude double precision,
    latitude double precision,
    humidity double precision,
    temperature double precision
);

CREATE TABLE IF NOT EXISTS data_pm10 (
    timestamp TIMESTAMP,
    sensor_id VARCHAR(20),
    value double precision,
    longitude double precision,
    latitude double precision,
    humidity double precision,
    temperature double precision
);

CREATE TABLE IF NOT EXISTS sensor_meta (
    sensor_id VARCHAR(20) UNIQUE,
    allow_public BOOLEAN,
    largest_read INT,
    col_offset_longitude INT,
    col_offset_latitude INT,
    col_offset_pm1 INT,
    col_offset_pm2_5 INT,
    col_offset_pm10 INT,
    col_offset_pressure INT,
    col_offset_temperature INT,
    col_offset_humidity INT,
    col_offset_dew_point INT
);

ALTER TABLE data_pm1 REPLICA IDENTITY FULL;
ALTER TABLE data_pm2_5 REPLICA IDENTITY FULL;
ALTER TABLE data_pm10 REPLICA IDENTITY FULL;

CREATE UNIQUE INDEX index_data_pm1 ON data_pm1(timestamp, sensor_id);
CREATE UNIQUE INDEX index_data_pm2_5 ON data_pm2_5(timestamp, sensor_id);
CREATE UNIQUE INDEX index_data_pm10 ON data_pm10(timestamp, sensor_id);