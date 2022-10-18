# docker buildx bake demo

- Container is just alpine with boto3 installed. Ignore quality thereof (which is terrible)
- The interesting parts are in the GitHub action
- Uses docker-metadata action to make labels etc and generate bake file
- Tags with SHA
- Tags with latest and pushes to repo if on default branch
- Build and push based on bake file

Note:

Bake action doesn't support a context, so there's a LOT of adding paths
unless your Dockerfile etc are in the root dir of your GitHub repo. Consider
logging an issue, but mostly probably just use `docker/build-push-action@v3`
action instead of bake.
