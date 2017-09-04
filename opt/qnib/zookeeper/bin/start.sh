#!/bin/bash

export JVMFLAGS=${EXTRA_ARGS}

zkServer.sh start-foreground
