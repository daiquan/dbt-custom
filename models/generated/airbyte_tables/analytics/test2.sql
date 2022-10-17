{{ config(
    schema = "analytics",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test1') }}
select
    org_urn as orgUrn,
    time_stamp,
    subscription_urn as subUrn
from {{ ref('test1') }}
where 1 = 1
