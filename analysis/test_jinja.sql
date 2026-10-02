{% set foods = ['tomate', 'concombre', 'piment', 'avocat', 'banane'] %}

{% for element in foods %}
        select '{{ element }}' as food
        {% if not loop.last %}
            union all
        {% endif %}
{% endfor %} 
  


{#% %#}