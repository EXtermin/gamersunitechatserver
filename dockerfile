#
# Build stage
#
FROM openjdk:latest
ADD . ./

RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash # for node version 10.x
RUN yum -y install nodejs
RUN node --version # optional to check that it worked
RUN npm --version # optional to check that it worked
# Install all the dependencies
RUN npm install --force

# Generate the build of the application
RUN npm run build

CMD ["node","app.js"]