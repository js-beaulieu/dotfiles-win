#!/usr/bin/env bash

STATUS_NAME=("running" "exited" "dead")
STATUS_ICON=("" "" "")

total_containers=0
for i in "${!STATUS_NAME[@]}"; do
    stat=${STATUS_NAME[$i]}
    icon=${STATUS_ICON[$i]}

    count=$(docker ps -qf status="$stat" | wc -l)
    total_containers="$((total_containers + count))"

    output="$output$icon $count   "
done


if [ "$total_containers" -gt 0 ]; then
    echo "$output"
else
    echo ""
fi

