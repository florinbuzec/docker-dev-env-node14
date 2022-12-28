FROM node:14.16.0-alpine3.13

# Assuming 'node' user exists from image, uid=1000
ARG NODE_USER
ARG NODE_APP
ARG NODE_PORT

ENV NODE_APP_SRC=${NODE_APP}/src
ENV NODE_ENV=dev

# setting GROUP var = USER
ARG USER=$NODE_USER
ARG GROUP=$NODE_USER

#RUN echo "NODE_PORT IS: $NODE_PORT"  skipcache

# [skip] creating user & set permissions
RUN mkdir $NODE_APP && chown $USER:$GROUP $NODE_APP

# [optional] - install node globals
#   RUN npm install -g create-react-app@5.0.1

# project
USER $USER
RUN mkdir -p $NODE_APP_SRC && chown $USER:$GROUP $NODE_APP
WORKDIR $NODE_APP_SRC

# take advantage of caching of Docker
COPY package*.json ./
RUN npm install

# rest of project files
COPY --chown=$USER:$GROUP . ./

EXPOSE 3000
# Vite default dev port
EXPOSE 5173

RUN echo "Please attach to this container (docker exec -it ... bash) and create the react project or run it."

# to always be started
CMD sleep infinity
