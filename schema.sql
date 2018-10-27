CREATE database youtube;
\connect youtube
CREATE SCHEMA entities;

CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;

CREATE TABLE youtube.entities.chan_stats
(
    time timestamptz DEFAULT now() NOT NULL,
    serial char(24) NOT NULL,
    subs bigint NOT NULL,
    videos int NOT NULL,
    views bigint NOT NULL
);

SELECT create_hypertable('youtube.entities.chan_stats', 'time');