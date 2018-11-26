** Create the Chart

$ helm create main
$ tree main
main
├── charts
├── Chart.yaml
├── templates
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── ingress.yaml
│   ├── NOTES.txt
│   └── service.yaml
└── values.yaml

** From the git source directory
$ cp deployment.yaml ../main/templates
$ cp service.yaml ../main/templates
** Install the Chart
$ helm install --name main /home/<user>/main
NAME:   main
LAST DEPLOYED: Sun Nov 25 15:11:39 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME  AGE
main  0s

==> v1/Pod(related)

NAME                   READY  STATUS             RESTARTS  AGE
main-xxxxxxxxxx-xxxxx  0/1    ContainerCreating  0         0s
main-xxxxxxxxxx-xxxxx  0/1    Pending            0         0s
main-xxxxxxxxxx-xxxxx  0/1    Pending            0         0s

==> v1/Service

NAME  AGE
main  1s

==> v1/Pod
main  0s
** NOTES (modified from the output):

$ export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services main)
$ export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
$ echo http://$NODE_IP:$NODE_PORT/
output http://X.X.X.X:12345/

$ kubectl get svc
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP      X.X.X.X        <none>        443/TCP          95d
main         LoadBalancer   Y.Y.Y.Y        <pending>     8500:12345/TCP   1m
$ helm ls
NAME    REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
main    1               Sun Nov 25 15:11:39 2018        DEPLOYED        main-0.1.0      1.0             default
$ kubectl get deployment
NAME      DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
main      3         3         3            3           7m

$ helm status main
LAST DEPLOYED: Sun Nov 25 15:11:39 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Service
NAME  AGE
main  2h

==> v1/Pod
main  2h

==> v1/Deployment
main  2h

==> v1/Pod(related)

NAME                   READY  STATUS   RESTARTS  AGE
main-xxxxxxxxxx-xxxxx  1/1    Running  0         2h
main-xxxxxxxxxx-xxxxx  1/1    Running  0         2h
main-xxxxxxxxxx-xxxxx  1/1    Running  0         2h

Thanks for the sources found in various places: helm.sh, stackoverflow (appropiate attribution underway)