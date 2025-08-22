SELECT
  project_id,
  user_email,
  total_bytes_processed,
  total_bytes_billed,
  query
FROM
  `nprd-dev-data-01`.`region-us-east4`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE
  job_type = 'QUERY'
  AND user_email = 'jose.medina@americanwell.com'
  AND LOWER(query) LIKE '%select%'
  AND LOWER(query) NOT LIKE '%information_schema%'
  AND creation_time > TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)
ORDER BY creation_time DESC;
