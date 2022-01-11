# docker buildx bake demo

- Container is just alpine with boto3 installed
- The interesting parts are in the GitHub action
- Extracts metainfo
- Tags with SHA
- Tags with latest and pushes to repo if on default branch
- Build and push based on bake file