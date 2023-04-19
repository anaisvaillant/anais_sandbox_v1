select * 
from {{
    metrics.calculate(
        metric('average_revenue_per_customer'),
        grain='year',
        dimensions=[]
    )
}}