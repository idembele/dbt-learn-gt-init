With payments as (
select * from {{ref('stg_stripe__payments')}}
),
pivot as (
    select order_id,
    {%- set payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] -%}

    {% for each_method in payment_methods %}

        sum(case 
                when payment_method = '{{each_method}}' then amount else 0 
            end
        ) as {{each_method}}_amount
    
        {%- if not loop.last -%}
        ,
        {%- endif -%}
    {% endfor %}

    from payments
    group by 1
)
select * from pivot