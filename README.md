# system stress
Start a simple script that stresses the system for a random period of time.

## Build the image
build the image with:
~~~bash
docker build . -t system-stressor:latest
~~~

## run as container

Run the built image with:

~~~bash
docker run system-stressor:latest
~~~