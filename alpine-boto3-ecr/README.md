# Boto3 ECR demo

- Uses a build container to build an alpine with boto3
- Does login to ECR
- Does a multiarch build
- Tags with SHA
- Tags with latest and pushes to repo if on default branch
- Uses straight docker commands for build, tag and push

Note that the build step only builds x64, while the arm64 is built
together with the push step. For some reason you can't combine
the `--load` option with `--platforms` in buildx in any useful way.
