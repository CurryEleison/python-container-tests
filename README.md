# Python Container Tests

Testing multistage builds with docker:
- Based on slim image
- Converts your Pipfile.lock to a requirements.txt
- Installs gcc in builder image so you can compile stuff
- Then builds dependencies from requirements.txt into wheels in /wheels
- Then uses the /wheels from the builder container to create a deployment container

File ´Dockerfile.alpine´ demonstrates building numpy in an alpine container. 


## TODO
[ ] Also add pandas, matplotlib, psycopg2, pymssql 

