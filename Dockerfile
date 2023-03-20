FROM nginx
COPY dist /usr/share/nginx/html
# RUN --mount=type=secret,id=VITE_REACT_APP_VERSION \
#     echo VITE_REACT_APP_VERSION=$(cat /run/secrets/VITE_REACT_APP_VERSION) >> .env
COPY .env /usr/share/nginx/html