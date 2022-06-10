#
# Build stage
#
FROM openjdk:latest
ADD . ./

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash
RUN apt-get install -y nodejs
# Install all the dependencies
RUN npm install --force

# Generate the build of the application
RUN npm run build

CMD ["node","app.js"]