{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_analytics",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test1_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'org_urn',
        'time_stamp',
        'subscription_urn',
    ]) }} as _airbyte_test1_hashid,
    tmp.*
from {{ ref('test1_ab2') }} tmp
-- test1
where 1 = 1

