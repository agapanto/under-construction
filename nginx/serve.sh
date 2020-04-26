envsubst < default.conf | tee /etc/nginx/conf.d/default.conf && nginx -g "daemon off;"
