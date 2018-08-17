#!/bin/bash

echo "buildando image"
docker build . -t SEUREPO/node-app:latest
docker build . -t SEUREPO/node-app:1


echo "enviando para o repo"
docker push SEUREPO/node-app:1
docker push SEUREPO/node-app:latest


# Como o deployment esta com imagepullPolice = always, basta executar um replace em seu yaml
kubectl replace -f app-deployment


