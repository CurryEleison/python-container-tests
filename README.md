# Python Container Tests

Testing multistage builds with docker:
- `slim-pipenv` shows how to do a multistage build starting with a Pipfile.lock, converting it to requirements.txt and then compile and copy the wheels
- `alpine-databases` shows how to do multistage build of popular database python packages
- `slim-datascience` is a multistage build of standard data science packages. This one needs work as the produced image is pretty bloated -- would be better just to create a straight image
- `alpine-datascience` is an attempt at getting matplotlib going in alpine. Not successful yet, but not sure the difference between alpine and slim are useful for this purpose.
