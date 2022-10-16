{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_analytics",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('analytics', '_airbyte_raw_test1') }}
select
    {{ json_extract_scalar('_airbyte_data', ['org_urn'], ['org_urn']) }} as org_urn,
    {{ json_extract_scalar('_airbyte_data', ['time_stamp'], ['time_stamp']) }} as time_stamp,
    {{ json_extract_scalar('_airbyte_data', ['subscription_urn'], ['subscription_urn']) }} as subscription_urn,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('analytics', '_airbyte_raw_test1') }} as table_alias
-- test1
where 1 = 1

