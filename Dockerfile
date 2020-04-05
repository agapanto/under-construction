FROM node:13.10.1-alpine

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


# If a social network url is not set, the social network icon won't be rendered
ENV VUE_APP_FACEBOOK_URL=$VUE_APP_FACEBOOK_URL
ENV VUE_APP_INSTAGRAM_URL=$VUE_APP_INSTAGRAM_URL
ENV VUE_APP_TWITTER_URL=$VUE_APP_TWITTER_URL
ENV VUE_APP_GITHUB_URL=$VUE_APP_GITHUB_URL
ENV VUE_APP_EMAIL_URL=$VUE_APP_EMAIL_URL

# Set website fonts
ENV VUE_APP_WEBSITE_TITLE_FONTFAMILY=$VUE_APP_WEBSITE_TITLE_FONTFAMILY

# Set website logo
ENV VUE_APP_WEBSITE_FAVICON_URL=$VUE_APP_WEBSITE_FAVICON_URL
ENV VUE_APP_WEBSITE_LOGO_URL=$VUE_APP_WEBSITE_LOGO_URL
ENV VUE_APP_WEBSITE_TITLE=$VUE_APP_WEBSITE_TITLE
ENV VUE_APP_WEBSITE_DESCRIPTION=$VUE_APP_WEBSITE_DESCRIPTION
ENV VUE_APP_WEBSITE_VIDEO_URL=$VUE_APP_WEBSITE_VIDEO_URL

ENV VUE_APP_WEBSITE_BACKGROUND_COLOR=$VUE_APP_WEBSITE_BACKGROUND_COLOR
ENV VUE_APP_WEBSITE_COLOR=$VUE_APP_WEBSITE_COLOR

ENV VUE_APP_HIDE_WEBSITE_FOOTER=$VUE_APP_HIDE_WEBSITE_FOOTER

ENV VUE_APP_BACKGROUND_IMAGE_URL=$VUE_APP_BACKGROUND_IMAGE_URL

# instalar un simple servidor http para servir nuestro contenido estático
RUN npm install -g http-server

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

EXPOSE 8080
CMD [ "http-server", "dist"]
