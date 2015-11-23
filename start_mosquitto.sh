echo "Starting Mosquitto..."

echo "HOME          : $HOME"
echo "MEMORY_LIMIT  : $MEMORY_LIMIT"
echo "PORT          : $PORT"
echo "PWD           : $PWD"
echo "TMPDIR        : $TMPDIR"
echo "USER          : $USER"
echo "VCAP_APP_HOST : $VCAP_APP_HOST"

if [ -z "$BRIDGE_ADDR" ]
then 

./mosquitto -c <(cat <<OPTS
listener $PORT
OPTS
)

else

./mosquitto -c <(cat <<OPTS
listener $PORT

connection main-broker
address $BRIDGE_ADDR
bridge_protocol_version mqttv311
topic # both 2

OPTS
)

fi;

