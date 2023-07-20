#!/usr/bin/env bash

project_dir="/data/project/"
mkdir -p "$project_dir"
cp /.move_config/* $project_dir
exec /opt/idea/bin/qodana "$@"