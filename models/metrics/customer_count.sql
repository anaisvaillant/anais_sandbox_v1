select * 
from {{
    metrics.calculate(
        metric('count_of_customers'),
        grain='year',
        dimensions=[]
    )
}}