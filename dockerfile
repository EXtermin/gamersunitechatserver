#
# Build stage
#
FROM openjdk:latest
ADD . ./
# Install all the dependencies
RUN npm install --force

# Generate the build of the application
RUN npm run build

CMD ["node","app.js"]