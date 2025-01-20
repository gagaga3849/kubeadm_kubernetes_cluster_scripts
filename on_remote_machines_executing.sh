#!/bin/bash

# Check if the script argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <script_name>"
  exit 1
fi

SCRIPT=$1

# Copy the script to each worker node
for worker in worker2 worker3; do
  echo "Copying $SCRIPT to $worker..."
  scp "$SCRIPT" vagrant@$worker:/tmp/
done

# Execute the script on each worker node
for worker in worker2 worker3; do
  echo "Running $SCRIPT on $worker..."
  ssh vagrant@$worker "bash /tmp/$SCRIPT"
done

