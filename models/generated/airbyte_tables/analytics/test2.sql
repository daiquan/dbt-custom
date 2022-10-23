{{ config(
    schema = "analytics",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
select
    org_urn as orgUrn,
    time_stamp,
    subscription_urn as subUrn
from analytics.test1
where 1 = 1

