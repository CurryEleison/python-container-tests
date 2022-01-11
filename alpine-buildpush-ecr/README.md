# Boto3 ECR demo

- Uses a build container to build an alpine with boto3
- Does login to ECR
- Does a multiarch build
- Tags with SHA
- Tags with latest and pushes to repo if on default branch
- Uses `docker/build-push-action@v2`
