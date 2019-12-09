#!/bin/bash

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

(
  cd ${HERE}
  NAME="`cat ${HERE}/BUILDER`"
  docker build --build-arg http_proxy --build-arg https_proxy --build-arg no_proxy -t ${NAME} .
)
