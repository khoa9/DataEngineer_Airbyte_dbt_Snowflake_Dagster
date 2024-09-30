# Welcome to your new Dagster project!

This project is structured to handle data orchestration using Dagster. Below is a brief explanation of the core components and how they fit together.

## Project Structure

- **`assets.py`**: Contains the data assets definitions. These are the building blocks of your pipeline and represent the core transformations of data.
- **`constants.py`**: Holds the constant values used throughout the project. This might include configurations like file paths, credentials, or API keys.
- **`definitions.py`**: The central file for defining jobs and pipelines. It ties together assets, schedules, and resources to construct the pipeline logic.
- **`schedules.py`**: Manages job scheduling. Defines when jobs should run, either on a regular schedule or triggered by external events.

## Using the starter project
Try running the following commands:

```bash
dagster-webserver
dagster job execute -f path_to_your_job.py
```

## 🔗 Resources:
- Learn more about Dagster in the [docs](https://docs.dagster.io/)
- Check out [Discourse](https://discourse.dagster.io/) for commonly asked questions and answers
- Join the [chat](https://dagster.slack.com/) on Slack for live discussions and support
- Find Dagster [events](https://dagster.io/events) near you
- Check out the [blog](https://dagster.io/blog) for the latest news on Dagster's development and best practices
