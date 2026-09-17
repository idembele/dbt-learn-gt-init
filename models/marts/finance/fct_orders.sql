with orders as (

select * from {{ref('stg_jaffle_shop__orders')}}

),

payments as (

select * from {{ref('stg_stripe__payments')}}

),

order_payments as (

    select
        order_id,
        sum(amount) as total_payment_amount
    from payments
    where status = 'success'
    group by 1

),


final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.total_payment_amount, 0) as total_payment_amount

    from orders

    left join order_payments using (order_id)
    
{#ceci est un commentaire#}
)

select * from final