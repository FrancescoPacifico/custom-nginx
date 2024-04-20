#!/bin/env bash

while true; do
  # Run the command in the background and capture its process id.
  # Redirect output to a temporary file.
  log.io-file-input >> entrypoint_output.txt &
  PID=$!

  # Check if the process is already terminated.
  if ! ps -p $PID &> /dev/null; then
    echo "Process already terminated."
    continue
  fi

  # Wait for a few seconds to allow the process to write to the temporary file.
  sleep 3

  # Read the entire output from the temporary file and check for the desired string.
  if ! grep -i -q "connected to server" entrypoint_output.txt; then
    echo "String 'connected to server' not found in the output. Killing process $PID."
    kill $PID
  else
    # If the desired string is found, break out of the loop.
    kill $PID
    break
  fi
done

# Remove the temporary file and start the log.io-file-input process.
rm entrypoint_output.txt
log.io-file-input
