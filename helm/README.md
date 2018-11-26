**Create the Chart**

$ helm create main </br>
$ tree main </br>
main </br>
├── charts </br>
├── Chart.yaml </br>
├── templates </br>
│   ├── deployment.yaml </br>
│   ├── _helpers.tpl </br>
│   ├── ingress.yaml </br>
│   ├── NOTES.txt </br>
│   └── service.yaml </br>
└── values.yaml</br>

**From the git source directory**

$ cp deployment.yaml ../main/templates </br>
$ cp service.yaml ../main/templates </br>

**Install the Chart**

$ helm install --name main /home/(user)/main </br>

NAME:   main </br>
LAST DEPLOYED: Sun Nov 25 15:11:39 2018 </br>
NAMESPACE: default </br>
STATUS: DEPLOYED </br>

RESOURCES: </br>
==> v1/Deployment </br>
NAME  AGE </br>
main  0s </br>

==> v1/Pod(related) </br>

NAME                   READY  STATUS             RESTARTS  AGE </br>
main-xxxxxxxxxx-xxxxx  0/1    ContainerCreating  0         0s </br>
main-xxxxxxxxxx-xxxxx  0/1    Pending            0         0s </br>
main-xxxxxxxxxx-xxxxx  0/1    Pending            0         0s </br>

==> v1/Service </br>

NAME  AGE </br>
main  1s </br>
==> v1/Pod </br>
main  0s </br>

**Notes (Modified from the output):**</br>

$ export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services main)</br>
$ export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")</br>
$ echo http://$NODE_IP:$NODE_PORT/</br>
output http://X.X.X.X:12345/</br>

$ kubectl get svc </br>
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE </br>
kubernetes   ClusterIP      X.X.X.X        <none>        443/TCP          95d </br>
main         LoadBalancer   Y.Y.Y.Y        <pending>     8500:12345/TCP   1m  </br>
$ helm ls </br>
NAME    REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE </br>
main    1               Sun Nov 25 15:11:39 2018        DEPLOYED        main-0.1.0      1.0             default   </br>
$ kubectl get deployment </br>
NAME      DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE </br>
main      3         3         3            3           7m  </br>

$ helm status main </br>
LAST DEPLOYED: Sun Nov 25 15:11:39 2018 </br>
NAMESPACE: default </br>
STATUS: DEPLOYED </br>

RESOURCES: </br>
==> v1/Service </br>
NAME  AGE </br>
 main  2h </br>

==> v1/Pod </br>
main  2h </br>

==> v1/Deployment </br>
main  2h </br>

==> v1/Pod(related) </br>
 
NAME                   READY  STATUS   RESTARTS  AGE</br>
main-xxxxxxxxxx-xxxxx  1/1    Running  0         2h </br>
main-xxxxxxxxxx-xxxxx  1/1    Running  0         2h </br>
main-xxxxxxxxxx-xxxxx  1/1    Running  0         2h </br>

Thanks for the sources found in various places: helm.sh, stackoverflow (appropiate attribution underway)</br>
