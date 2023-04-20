# Dockerize React

Repo for the step by step tutorial of Dockerizing a React app: https://jsramblings.com/dockerizing-a-react-app/

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
us-central1-docker.pkg.dev/gcp-three-tier-ref-app/alex-temp/hello-app:1.0.0
```

```
docker push us-central1-docker.pkg.dev/gcp-three-tier-ref-app/alex-temp/hello-app:1.0.0
```
