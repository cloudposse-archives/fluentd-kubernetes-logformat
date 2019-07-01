FROM cloudposse/fluentd-kubernetes-daemonset:v1.4.2-debian-elasticsearch-1.1

RUN sudo gem install fluent-plugin-parser-logfmt \
 && sudo gem install fluent-plugin-rewrite-tag-filter \
 && sudo gem sources --clear-all \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

COPY conf.d /fluentd/etc/conf.d
