# Information:

Estrutura de yamls ingress-nginx from gcp;
Estrutura de yamls kubernetes;

# Usage:

- Criar ingress nginx:
```sh
$ kubectl create -f ./ingress-nginx/
```
- Build aplication node:
```sh
docker build . -t SEUREPOSITORIO/node-app:latest  && docker push SEUREPOSITORIO/node-app:latest
docker build . -t SEUREPOSITORIO/node-app:1  && docker push SEUREPOSITORIO/node-app:1
```
- criar namespace:
```sh
kubectl create -f ./namespace
```

- criar yamls application ( deployment , hpa, ingress, service):
```sh
kubectl create -f app-deployment.yaml
kubectl create -f app-hpa.yaml
kubectl create -f app-ingress.yaml
kubectl create -f app-service.yaml
```

obs: Para expor HTTPS é necessario criar a secret tls-rafael-teste com os certs do dominio rafael.teste



- "Configurando hosts"
```sh
IPNGINX=$(kubectl get services -n ingress-nginx | grep ingress-nginx  | awk '{print $4}')
echo "$IPNGINX	nodeapp.rafael.teste"  >>  /etc/hosts	
```
