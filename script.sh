#!/bin/bash
docker build -t ghcr.io/supolabs/frappe-socketio -f build/frappe-socketio/Dockerfile .
docker build -t ghcr.io/supolabs/frappe-worker -f build/frappe-worker/Dockerfile .
docker build -t ghcr.io/supolabs/frappe-nginx -f build/frappe-nginx/Dockerfile .
docker build -t ghcr.io/supolabs/erpnext-worker -f build/erpnext-worker/Dockerfile .
docker build -t ghcr.io/supolabs/erpnext-nginx -f build/erpnext-nginx/Dockerfile .

docker push ghcr.io/supolabs/frappe-socketio:latest
docker push ghcr.io/supolabs/frappe-worker:latest
docker push ghcr.io/supolabs/frappe-nginx:latest
docker push ghcr.io/supolabs/erpnext-worker:latest
docker push ghcr.io/supolabs/erpnext-nginx:latest
