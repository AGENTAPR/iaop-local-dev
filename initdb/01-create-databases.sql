-- Creates one database per IAOP service (database-per-service).
-- Idempotent: safe to run on an already-initialized volume.

DO $$
DECLARE
    svc text;
    services text[] := ARRAY[
        'recruitment', 'onboarding', 'agent', 'agency', 'learning',
        'certification', 'eligibility', 'sales', 'portfolio',
        'commission', 'compliance', 'performance', 'workflow',
        'integration', 'notification', 'document'
    ];
BEGIN
    FOREACH svc IN ARRAY services LOOP
        IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'iaop_' || svc) THEN
            EXECUTE format('CREATE DATABASE %I OWNER iaop', 'iaop_' || svc);
        END IF;
    END LOOP;
END $$;
