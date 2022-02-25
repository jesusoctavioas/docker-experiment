exec docker run \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v pandora:/tmp/.X11-unix \
  -e DISPLAY="$DISPLAY" \
  --rm \
  -it \
  fish
