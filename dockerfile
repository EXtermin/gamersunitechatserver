#
# Build stage
#
FROM openjdk:latest
ADD . ./

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash # for node version 10.x
RUN apt-get install -y nodejs
# Install all the dependencies
RUN npm install --force

# Generate the build of the application
RUN npm run build

CMD ["node","app.js"]