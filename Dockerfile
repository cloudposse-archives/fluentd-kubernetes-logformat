FROM cloudposse/fluentd-kubernetes-daemonset:v1.4.2-debian-elasticsearch-1.0

RUN gem install fluent-plugin-parser-logfmt \
 && gem install fluent-plugin-rewrite-tag-filter \
 && gem install fluent-plugin-throttle \
 && gem install fluent-plugin-kinesis \
 && gem sources --clear-all \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

COPY conf.d /fluentd/etc/conf.d
COPY fluent_kinesis.conf /fluentd/etc/fluent.conf
