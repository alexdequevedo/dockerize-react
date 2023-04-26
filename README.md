# Sample App

Sample Application to be deployed on Compute Engine

## Opening SSH tunnel

```
gcloud compute  ssh --ssh-flag="-L 3000:localhost:3000"  --zone <ZONE> --project <PROJECT_ID> --tunnel-through-iap <INSTANCE_NAME>
```

## Build the Docker image:

```
docker build . -t dockerized-react
```

## Run the image:

```
docker run -p 3000:80 -d dockerized-react
```

## Send to Artifact Registry
```
gcloud auth configure-docker us-central1-docker.pkg.dev
```

```
docker tag dockerized-react \
us-central1-docker.pkg.dev/<PROJECT_ID>/<REPO_NAME>/hello-app:1.0.0
```

```
docker push us-central1-docker.pkg.dev/<PROJECT_ID>/<REPO_NAME>/hello-app:1.0.0
```
