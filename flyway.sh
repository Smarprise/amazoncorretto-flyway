#!/bin/bash -e
java -classpath "/opt/flyway/lib/*" "org.flywaydb.commandline.Main" "$@"
