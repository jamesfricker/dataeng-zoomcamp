# !/bin/sh```

TAG=w1_de_zoomcamp:latest

docker build -f Dockerfile_q1 . -t ${TAG}

# Pip Output
# Package    Version
# ---------- -------
# pip        21.0.1
# setuptools 53.0.0
# wheel      0.36.2

# grep to remove first two lines

docker run -it ${TAG} "pip list && pip list | grep -v \"Package\" | grep -v \"-\"| wc -l"
