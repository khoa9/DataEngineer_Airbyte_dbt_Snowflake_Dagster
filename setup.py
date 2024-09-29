from setuptools import find_packages, setup

setup(
    name="DataEngineer_Airbyte_dbt_Snowflake_Dagster",
    packages=find_packages(),
    install_requires=[
        "dbt-core",
        "dbt-snowflake",
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dagster-airbyte",
    ],
    extras_require={"dev": ["dagit", "pytest"]},
)