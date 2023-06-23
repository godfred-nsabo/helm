# Variables
NAMESPACE = default
DEPLOYMENT = nodeapp
SERVICE = nodeapp
LOCALPORT := 5000
REMOTEPORT := 5000

# Targets
.PHONY: generate_name create_helm build push_image logs pods delete_deployment delete_service install_app get_service

create_helm:
	helm create <app name>

generate_name:
	helm install app --generate-name

build:
	docker build -t gnsabo/nodeapp .

push_image:
	docker push gnsabo/nodeapp:latest

logs:
	kubectl logs -f deployments/$(DEPLOYMENT) -n $(NAMESPACE)

pods:
	kubectl get pods -n $(NAMESPACE)

get_deployment:
	kubectl get deployments/$(DEPLOYMENT) -n $(NAMESPACE)

get_service:
	minikube service -n $(NAMESPACE) $(SERVICE) --url

delete_deployment:
	kubectl delete deployments/$(DEPLOYMENT) -n $(NAMESPACE)

delete_service:
	kubectl delete service/$(SERVICE) -n $(NAMESPACE)

delete_secret:
	kubectl delete secrets regcred -n $(NAMESPACE)

install_app:
	npm install

expose_ip_address:
	kubectl port-forward svc/$(SERVICE) -n $(NAMESPACE) $(LOCALPORT):$(REMOTEPORT)

