FROM node:13.10.1-alpine as node-build-stage

# Set default values to pass as env var on Docker image buildtime
ARG VUE_APP_FACEBOOK_URL=''
ARG VUE_APP_INSTAGRAM_URL=''
ARG VUE_APP_TWITTER_URL=''
ARG VUE_APP_GITHUB_URL=''
ARG VUE_APP_EMAIL_URL=''

ARG VUE_APP_WEBSITE_TITLE_FONTFAMILY='Bungee, cursive'
ARG VUE_APP_WEBSITE_FAVICON_URL=''
ARG VUE_APP_WEBSITE_LOGO_URL=''
ARG VUE_APP_WEBSITE_TITLE='Sitio web en desarrollo'
ARG VUE_APP_WEBSITE_DESCRIPTION='Estamos creando una experiencia personalizada para ti, mientras tanto puedes enterarte de este proyecto en las redes sociales a continuación.'
ARG VUE_APP_WEBSITE_VIDEO_URL=''

ARG VUE_APP_WEBSITE_BACKGROUND_COLOR='#4d0059'
ARG VUE_APP_WEBSITE_COLOR='white'
ARG VUE_APP_HIDE_WEBSITE_FOOTER='False'
ARG VUE_APP_BACKGROUND_IMAGE_URL='url("https://www.transparenttextures.com/patterns/shattered.png")'
ARG VUE_APP_ANALYTICS_ID=''

# hacer la carpeta 'app' el directorio de trabajo actual
WORKDIR /app

# copiar 'package.json' y 'package-lock.json' (si están disponibles)
COPY package*.json ./

# instalar dependencias del proyecto
RUN npm install

# copiar los archivos y carpetas del proyecto al directorio de trabajo actual (es decir, la carpeta 'app')
COPY . .

# construir aplicación para producción minificada
RUN npm run build

# production stage
FROM nginx:1.13.12-alpine as production-stage

# copiar el sitio web construido para ser servido por nginx
COPY --from=node-build-stage /app/dist /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
