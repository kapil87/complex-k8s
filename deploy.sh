docker build -t kdev87/multi-client:latest -t kdev87/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kdev87/multi-server:latest -t kdev87/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kdev87/multi-worker:latest -t kdev87/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push kdev87/multi-client:latest
docker push kdev87/multi-server:latest 
docker push kdev87/multi-worker:latest

docker push kdev87/multi-client:$SHA
docker push kdev87/multi-server:$SHA 
docker push kdev87/multi-worker:$SHA

kubectl apply k8s

kubectl set image deployments/server-deployment server=kdev87/multi-server:$SHA
kubectl set image deployments/client-deployment client=kdev87/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=kdev87/multi-worker:$SHA
