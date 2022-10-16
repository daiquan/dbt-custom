{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_analytics",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test1_ab1') }}
select
    cast(org_urn as {{ dbt_utils.type_string() }}) as org_urn,
    cast(time_stamp as {{ dbt_utils.type_string() }}) as time_stamp,
    cast(subscription_urn as {{ dbt_utils.type_string() }}) as subscription_urn,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test1_ab1') }}
-- test1
where 1 = 1

