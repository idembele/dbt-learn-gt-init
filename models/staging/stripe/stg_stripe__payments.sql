{#{ config(materialized='table') }      Modif model output to table or view#}

{#{ config(materialized='incremental') }        Incremental Append#}

{#{ config(materialized='incremental',unique_key='customer_id') }       Incremental merge#}


select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount/100 as amount,
        created as payment_created
from {{source('stripe', 'payment')}}