#!/bin/bash

set -e

cat <<EOF > ~/.dogrc
[Connection]
apikey = $DD_API_KEY
appkey = $DD_APP_KEY
EOF

chmod 400 ~/.dogrc