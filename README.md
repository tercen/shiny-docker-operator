# ATSNE

```
https://github.com/tercen/shiny_docker_operator.git
```
## Build

```bash
VERSION=0.10.0.1
docker build -t tercen/shiny_docker_operator:$VERSION .
docker push tercen/shiny_docker_operator:$VERSION
# see operator.json -- "container": "tercen/atsne:1.1.8"
git add -A && git commit -m "$VERSION" && git tag  $VERSION  && git push && git push --tags
```

```bash
# renv cache ~/.local/share/renv
docker run -it --rm --entrypoint "/bin/bash" tercen/shiny_docker_operator:0.10.0.0 
```