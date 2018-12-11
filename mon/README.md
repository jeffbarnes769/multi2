**Container management, visualization and monitoring**

Portainer <https://portainer.io/> is an opensource utility that allows you to manage containers, images, networks and volumes.  Installation instructions from the Portainer website 
```
$ docker volume create portainer_data
$ docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```
Weave Scope, from Weaveworks, visualizes kubernetes clusters.  Installation instructions are here <https://www.weave.works/docs/scope/latest/installing/>.  Modify scope.yaml and kubectl command as required

```
kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```
Redirect port-forwarding to http://localhost:4040 using the following: 
```
kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040 & 
```
<img src="https://github.com/jeffbarnes769/multi2/blob/master/img/Weavescope.jpg" width="600">

Configure monitoring using Brice Fernandes @fractallambda excellent presentations
 * Install Prometheus and Grafana (TBA)
 * Modify and run https://github.com/bricef/metrics-demo/blob/master/manifests/local/monitoring.yaml
 * Modify and import dashboard defintion into Grafana  https://github.com/bricef/metrics-demo/blob/master/resources/docker-monitoring_rev1.json
 
 <img src="https://github.com/jeffbarnes769/multi2/blob/master/img/Grafana.jpg" width="600">

