#
# Build stage
#
FROM openjdk:latest
ADD . ./
RUN npm install -ci
CMD ["node","app.js"]