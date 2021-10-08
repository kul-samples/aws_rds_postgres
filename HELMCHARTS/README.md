### Setting up `HELM`
- `wget https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz && tar -xvf helm-v3.7.0-linux-amd64.tar.gz`
- `sudo mv linux-amd64/helm /usr/bin/ && sudo chmod 755 /usr/bin/helm && rm -rf helm-v3.7.0-linux-amd64.tar.gz linux-amd64/`
- `helm version`
### Expected Output
```
version.BuildInfo{Version:"v3.7.0", GitCommit:"eeac83883cb4014fe60267ec6373570374ce770b", GitTreeState:"clean", GoVersion:"go1.16.8"}
```

### Different HELM Commands
- `helm create postgres` # to Create folder structure for HELM packaging
- `helm lint` # to check the syntax error in the files created
- `helm package postgres/` # to create HELM package
- `helm install postgres-1.0.0 postgres-1.0.0.tgz` # to install HELM package
- `helm ls` # to list all helm packages
- `helm status postgres-1.0.0` # to get status of HELM package
- `helm upgrade nodejs-v1 nodejs-1.2.0.tgz` # to upgrade current installation to next version
- `helm uninstall nodejs-v1` # to remove the install HELM package

### Chart.yaml
#### This file contains the metadata about the helm chart to be prepared, like its name, description, version, etc.
### values.yaml
#### This file contains all the values which will be updates inside the manifests files avaiable under templates folder of each package

