# OK! Lets get started building the image our app will run in.

# First, tell the docker daemon that we want to start with the base nodejs image. 
# This will already have nodejs and npm already installed.
FROM node:16-alpine

# Copy all our files in this directory into the image we are building
COPY . . 

# Install the dependencies so that all our node_modules are available
# when we start up a container from this image.
RUN npm install

# Finally, set the default command to run when we start a container from this image.
# This command does not run while we are building the image, only when we run a container from it.
CMD [ "node", "index.js" ]