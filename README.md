# Python Container Tests

Testing multistage and multiarch builds with docker:
- `slim-testing` is the most complete. It does a multistage, multiarch build with integrated linting and testing. 
- `slim-pipenv` shows how to do a multistage build starting with a Pipfile.lock, converting it to requirements.txt and then compile and copy the wheels
- `alpine-databases` shows how to do multistage build of popular database python packages
- `slim-datascience` is a multistage build of standard data science packages. This one needs work as the produced image is pretty bloated -- would be better just to create a straight image
- `alpine-datascience` is an attempt at getting matplotlib going in alpine. Not successful yet, but it demonstrates that the savings from using alpine are not worth it for this type of container.
- `alpine-bake-meta`, `alpine-boto3-ecr` and `alpine-buildpush-ecr` are different ways to push to AWS ECR.
    - `alpine-buildpush-ecr` is the best for copy/pasting
    - `alpine-bake-meta` mostly demonstrates that the docker bake action isn't quite there yet
    - `alpine-boto3-ecr` is about manual running of docker buildx commands
