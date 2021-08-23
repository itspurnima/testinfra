Deploying the php application on AWS using Kubernetes
1. Launch Linux EC2 instance in AWS (install JDK,php,apache,docker,jenkins and Kubernetes)
2. Create docker file
3.create deployment.xml with 2 replicas and load balancer
4. Create Jenkinsfile
stages:
a.scm checkout
b.create docker image with the help of dockerfile
c.push the docker image to docker hub
d.removing the existing containers on the remote.
e.deploying the application on remote using deployment.xml
5.to check the spplication
for pods
kubectl get pods
for service
kubectl get svs
using the eternal ip we can access the application on browser.
6.Check status of the current deployment
kubectl rollout status deployment nodeapp
Updating deployment
For example we want to change number of replicas, change replicas in yaml and run following command

kubectl apply -f deployment.yml  --record=true
Kubernetes Deployment revisions
Kubernetes maintains deployment state of all versions


