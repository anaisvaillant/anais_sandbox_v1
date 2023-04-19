select * 
from {{ metrics.calculate(
    metric('total_revenue'),
    grain='month',
    secondary_calculations=[
        metrics.period_over_period( comparison_strategy="ratio", interval=1, alias="mom_change"),
        metrics.prior( interval=1, alias="last_month"),
        metrics.period_over_period( comparison_strategy="ratio", interval=12, alias="yoy_change"),
        metrics.period_to_date(aggregate="sum", period="year")
    ]
)
}}
order by date_month desc  