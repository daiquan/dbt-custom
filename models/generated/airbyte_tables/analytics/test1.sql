{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "analytics",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test1_ab3') }}
select
    org_urn as orgurn,
    time_stamp,
    subscription_urn,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_test1_hashid
from {{ ref('test1_ab3') }}
-- test1 from {{ source('analytics', '_airbyte_raw_test1') }}
where 1 = 1

