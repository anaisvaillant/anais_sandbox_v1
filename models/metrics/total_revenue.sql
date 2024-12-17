select * 

from {{
    metrics.calculate(
        metric('total_revenue'),
        grain='year',
        dimensions=['customer_key']
    )
}}

order by date_year