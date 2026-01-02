FROM node:25-alpine AS base
ENV NODE_ENV=production
RUN corepack enable

FROM base AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install

FROM base
COPY --from=build /usr/src/app /usr/src/app
WORKDIR /usr/src/app
CMD [ "node", "." ]
