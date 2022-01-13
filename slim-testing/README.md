# Docker build with test

- Creates a base first, and install common dependencies
- Demonstrates Pipenv usage, translating to requirements.txt for build container
- Demonstrates setting up a user inside the container
- Makes a test container from the base
    - Runs pytest and pylama
- Also a builder container from base
- And makes use of the builder container for a quite clean production container

Notes:
- Important/useful to have `.pytest_cache/` in .dockerignore
