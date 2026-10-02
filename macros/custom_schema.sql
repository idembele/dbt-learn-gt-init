{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- set env = env_var('DBT_ENV_NAME') -%} {#ligne V2 pour config variable d'environnement#}
    
    {#%- if custom_schema_name is none -%#}
    {%- if custom_schema_name is none or env != 'prod' -%} {#modif de ligne ci-dessus pour prise en compte de variable d'environnement#}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}