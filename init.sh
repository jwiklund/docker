/opt/couchbase/etc/couchbase_init.d start
sleep 10
/opt/couchbase/bin/couchbase-cli node-init -c localhost --node-init-data-path=/tmp/couchbase
/opt/couchbase/bin/couchbase-cli cluster-init -c localhost  --cluster-init-username=polopoly --cluster-init-password=1q2w3e --cluster-init-ramsize=500
/opt/couchbase/bin/couchbase-cli bucket-create -c localhost -u polopoly -p 1q2w3e --bucket=cmbucket --bucket-password=cmpasswd --bucket-type=couchbase --bucket-ramsize=500 --bucket-replica=1 --wait
