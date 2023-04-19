select * 
from {{
    metrics.calculate(
        metric('quantity'),
        grain='day',
        dimensions=[]
    )
}}