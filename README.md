# A CF droplet for Mosquitto 1.4.4


## Building the droplet (using Lattice)

You can build the droplet using the binary buildpack

```bash
ltc build-droplet mosquitto https://github.com/cloudfoundry/binary-buildpack.git
```

## Launching the droplet

You can easily deploy Mosquitto with the following command.

```bash
ltc ld mosquitto-app mosquitto -p 1883 -T 1883:1883 -e BRIDGE_ADDR=iot.eclipse.org
```

Providing a BRIDGE_ADDR environment variable allows all your broker instances to actually be interconnected, by means of a "master" broker that passes data back and forth between the different instances.