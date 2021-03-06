#!/bin/bash

# this file is mostly meant to be used by the author himself.

root=`pwd`
version=${1:-1.0.5}
home=~
force=$2

# the ngx-build script is from https://github.com/agentzh/nginx-devel-utils

            #--add-module=$home/work/nginx_upload_module-2.2.0 \

            #--without-pcre \
            #--without-http_rewrite_module \

ngx-build $force $version \
        --with-http_ssl_module \
            --add-module=$root/../ndk-nginx-module \
            --add-module=$root/../set-misc-nginx-module \
            --with-cc-opt=$'-I/opt/pcre820jit/include' \
            --with-ld-opt="-L/opt/pcre820jit/lib -Wl,-rpath,/opt/pcre820jit/lib:/opt/drizzle/lib:/usr/local/lib:/home/lz/lib:/usr/local/openresty/luajit/lib" \
            --without-mail_pop3_module \
            --without-mail_imap_module \
            --without-mail_smtp_module \
            --without-http_upstream_ip_hash_module \
            --without-http_empty_gif_module \
            --without-http_memcached_module \
            --without-http_referer_module \
            --without-http_autoindex_module \
            --without-http_auth_basic_module \
            --without-http_userid_module \
                --add-module=$home/work/nginx/ngx_http_auth_request_module-0.2 \
                --add-module=$root/../echo-nginx-module \
                --add-module=$root/../memc-nginx-module \
                --add-module=$root \
              --add-module=$root/../headers-more-nginx-module \
                --add-module=$root/../drizzle-nginx-module \
                --add-module=$home/work/nginx/ngx_http_upstream_keepalive-2ce9d8a1ca93 \
                --add-module=$root/../rds-json-nginx-module \
          --with-select_module \
          --with-poll_module \
          --with-rtsig_module \
                $opts \
                --with-debug

