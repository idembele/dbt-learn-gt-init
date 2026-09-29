/*Test specifique ou aussi test métier*/
select payment_id,
sum(amount) as total_payment_amount
from {{ ref('stg_stripe__payments') }}
group by 1
having total_payment_amount < 0