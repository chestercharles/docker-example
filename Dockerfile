# This file has the instructions on how to build the image our app will run in.

# First, tell the docker daemon that we want to start with the base nodejs image. 
# This will already have nodejs and npm already installed.
FROM node:16-alpine

# Copy our node source code into the image
COPY ./src ./src

# Set the working directory to the source code directory
WORKDIR /src

# Install the dependencies so that all our node_modules are available
# when we start up a container from this image.
RUN npm install

# Finally, set the default command to run when we start a container from this image.
# This command does not run while we are building the image, only when we run a container from it.
CMD [ "node", "index.js" ]