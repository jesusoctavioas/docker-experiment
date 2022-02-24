COOKIE_FILE="$HOME/container-cookie"
COOKIE="$(xauth nlist $DISPLAY | sed -e 's/^..../ffff/')"

# generate x11 cookie
touch "$COOKIE_FILE"
echo "$COOKIE" | xauth -f "$COOKIE_FILE" nmerge -

# move x11 cookie to shared directory
mv "$COOKIE_FILE" /tmp/.X11-unix

exec docker run \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v pandora:/tmp/.X11-unix \
  -e DISPLAY="$DISPLAY" \
  -e CONTAINERS="$CONTAINERS" \
  --rm \
  -it \
  fish
