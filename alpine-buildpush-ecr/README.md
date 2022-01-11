# Boto3 ECR demo w. docker/build-push-action

- Uses a build container to build an alpine with boto3
- Does login to ECR
- Does a multiarch build
- Tags with SHA
- Tags with latest and pushes to repo if on default branch
- Uses `docker/build-push-action@v2`

Probably, this is better than using bake and/or straight docker
commands. Bake doesn't seem quite finished at this point
and the metadata action sets up the labels and tags in a nice,
workable way.
