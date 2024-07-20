# synthea_docker

Container for running synthea.

This is an updated clone from https://github.com/intersystems-community/irisdemo-base-synthea  
Changes:
- Java 8 --> Java 11
- if synthea.properties.local file exists at root directory, replaces default synthea.properties during Docker build

See Synthea documentation at https://github.com/synthetichealth/synthea for examples of parameters to the container. Basically, any paramether you can pass to synthea, you can also pass to this container. Example:

```bash
#!/bin/bash
VERSION=$(cat ./VERSION)
docker run --rm -v $PWD/output:/output --name synthea-docker mgkahn/synthea:version-$VERSION -p 5
```

This will generate 5 patients on folder output/fhir (using the FHIR standard).
