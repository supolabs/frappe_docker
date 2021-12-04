erpnext-build:
	docker build -t ghcr.io/supolabs/erpnext-worker -f build/erpnext-worker/Dockerfile .
	docker build -t ghcr.io/supolabs/erpnext-nginx -f build/erpnext-nginx/Dockerfile .

erpnext-push: erpnext-build
	docker push ghcr.io/supolabs/erpnext-worker:latest
	docker push ghcr.io/supolabs/erpnext-nginx:latest

frappe-build:
	docker build -t ghcr.io/supolabs/frappe-socketio -f build/frappe-socketio/Dockerfile .
	docker build -t ghcr.io/supolabs/frappe-worker -f build/frappe-worker/Dockerfile .
	docker build -t ghcr.io/supolabs/frappe-nginx -f build/frappe-nginx/Dockerfile .

frappe-push: frappe-build
	docker push ghcr.io/supolabs/frappe-socketio:latest
	docker push ghcr.io/supolabs/frappe-worker:latest
	docker push ghcr.io/supolabs/frappe-nginx:latest

push: frappe-push erpnext-push

deploy:
	cd ../ssh && sudo ssh -i "supo-labs-development.pem" ubuntu@ec2-3-108-255-113.ap-south-1.compute.amazonaws.com "cd supolabs && docker-compose pull && docker-compose down -t 1 && docker-compose up -d"
	echo "Deployed"
