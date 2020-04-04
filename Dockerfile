FROM node:13.10.1-alpine

# Set default values to pass as env var on Docker image buildtime
ARG FACEBOOK_URL=''
ARG INSTAGRAM_URL=''
ARG TWITTER_URL=''
ARG GITHUB_URL=''
ARG EMAIL_URL=''

ARG WEBSITE_TITLE_FONTFAMILY='Bungee, cursive'
ARG WEBSITE_FAVICON_URL=''
ARG WEBSITE_LOGO_URL=''
ARG WEBSITE_TITLE='Sitio web en desarrollo'
ARG WEBSITE_DESCRIPTION='Estamos creando una experiencia personalizada para ti, mientras tanto puedes enterarte de este proyecto en las redes sociales a continuación.'
ARG WEBSITE_VIDEO_URL=''

ARG WEBSITE_BACKGROUND_COLOR='#4d0059'
ARG WEBSITE_COLOR='white'
ARG HIDE_WEBSITE_FOOTER='False'
ARG BACKGROUND_IMAGE_URL='url("https://www.transparenttextures.com/patterns/shattered.png")'


# If a social network url is not set, the social network icon won't be rendered
ENV VUE_APP_FACEBOOK_URL=$FACEBOOK_URL
ENV VUE_APP_INSTAGRAM_URL=$INSTAGRAM_URL
ENV VUE_APP_TWITTER_URL=$TWITTER_URL
ENV VUE_APP_GITHUB_URL=$GITHUB_URL
ENV VUE_APP_EMAIL_URL=$EMAIL_URL

# Set website fonts
ENV VUE_APP_WEBSITE_TITLE_FONTFAMILY=$WEBSITE_TITLE_FONTFAMILY

# Set website logo
ENV VUE_APP_WEBSITE_FAVICON_URL=$WEBSITE_FAVICON_URL
ENV VUE_APP_WEBSITE_LOGO_URL=$WEBSITE_LOGO_URL
ENV VUE_APP_WEBSITE_TITLE=$WEBSITE_TITLE
ENV VUE_APP_WEBSITE_DESCRIPTION=$WEBSITE_DESCRIPTION
ENV VUE_APP_WEBSITE_VIDEO_URL=$WEBSITE_VIDEO_URL

ENV VUE_APP_WEBSITE_BACKGROUND_COLOR=$WEBSITE_BACKGROUND_COLOR
ENV VUE_APP_WEBSITE_COLOR=$WEBSITE_COLOR

ENV VUE_APP_HIDE_WEBSITE_FOOTER=$HIDE_WEBSITE_FOOTER

ENV VUE_APP_BACKGROUND_IMAGE_URL=$BACKGROUND_IMAGE_URL

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
