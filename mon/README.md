**Container management, visualization and monitoring**

Portainer <https://portainer.io/> is an opensource utility that allows you to manage containers, images, networks and volumes.  Installation instructions from the Portainer website 
```
$ docker volume create portainer_data
$ docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```
 <img src="https://github.com/jeffbarnes769/multi2/blob/master/img/portainer1.jpg" width="500">

Weave Scope, from Weaveworks, visualizes kubernetes clusters.  Installation instructions are here <https://www.weave.works/docs/scope/latest/installing/>.  Modify scope.yaml and kubectl command as required

```
kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```
Redirect port-forwarding to http://localhost:4040 using the following: 
```
kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040 & 
```
<img src="https://github.com/jeffbarnes769/multi2/blob/master/img/Weavescope.jpg" width="500">

Configure monitoring with Prometheus and Grafana.  Thanks Brice Fernandes! @fractallambda
* Modify https://github.com/bricef/metrics-demo/blob/master/manifests/local/monitoring.yaml and run
```
kubectl apply -f <monitoring.yaml>
kubectl get svc
NAME                  TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
grafana               NodePort       A.B.C.D          <none>        3000:30002/TCP   86d
internal-prometheus   ClusterIP      10.110.66.138    <none>        9090/TCP         86d
kubernetes            ClusterIP      A.B.C.D          <none>        443/TCP          134d
main                  LoadBalancer   A.B.C.D          localhost     8500:30991/TCP   15d
prometheus            NodePort       A.B.C.D          <none>        9090:30003/TCP   86d
```
* Edit data source built-in Prometheus Provider
<img src="https://github.com/jeffbarnes769/multi2/blob/master/img/DataSeries1.jpg" width="400">

* Modify dashboard https://github.com/bricef/metrics-demo/blob/master/resources/docker-monitoring_rev1.json

* Import into Grafana
<img src="https://github.com/jeffbarnes769/multi2/blob/master/img/importdashboard.jpg" width="400">

* More monitoring with Prometheus and Grafana

<img src="https://github.com/jeffbarnes769/multi2/blob/master/img/Prometheus1.jpg" width="400">
<img src="https://github.com/jeffbarnes769/multi2/blob/master/img/Grafana1.jpg" width="400">
