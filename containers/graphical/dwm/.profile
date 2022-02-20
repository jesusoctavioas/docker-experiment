exec docker run \
	-e XAUTHORITY="$XAUTHORITY" \
	-e DISPLAY="$DISPLAY" \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--rm \
	-it \
	fish
