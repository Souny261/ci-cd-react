# FROM nginx
# COPY dist /usr/share/nginx/html

FROM node:14
WORKDIR /app

COPY package.json ./
COPY ./ ./

# RUN --mount=type=secret,id=REACT_APP_HTTP_URL \
#     --mount=type=secret,id=REACT_APP_GOOGLE_API \
#     echo REACT_APP_HTTP_URL=$(cat /run/secrets/REACT_APP_HTTP_URL) >> .env && \
#     echo REACT_APP_GOOGLE_API=$(cat /run/secrets/REACT_APP_GOOGLE_API) >> .env

RUN npm install -g serve
RUN npm i
RUN npm run build

EXPOSE 3000
CMD ["serve", "-s", "build"]