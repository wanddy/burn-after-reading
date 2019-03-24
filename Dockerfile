FROM tiangolo/uwsgi-nginx:python3.6

# Install requirements (dependencies). Changing the lock file will trigger updates
RUN apt-get update & apt-get install git

ADD Pipfile Pipfile.lock ./
RUN pip install pipenv
RUN pipenv install --system

# Add the application code and install it as a package
COPY . ./

# Add our default docker files (such as wsgi.py entrypoint)
ADD docker_files/* ./