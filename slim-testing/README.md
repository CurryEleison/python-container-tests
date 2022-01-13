# Docker build with test

- Creates a base first, and install common dependencies
- Makes a test container from the base
    - Runs pytest and pylama
- Also a builder container from base
- And makes use of the builder container for a production container

Notes:
- Important/useful to have `.pytest_cache/` in .dockerignore
