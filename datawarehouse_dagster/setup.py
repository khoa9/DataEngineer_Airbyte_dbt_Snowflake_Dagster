from setuptools import find_packages, setup

setup(
    name="datawarehouse_dagster",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        "datawarehouse_dagster": [
            "dbt-project/**/*",
        ],
    },
    install_requires=[
        "dagster"
        "dagster-cloud",
        "dagster-airbyte",
        "dagster-dbt",
        "dbt-snowflake<1.9",
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)