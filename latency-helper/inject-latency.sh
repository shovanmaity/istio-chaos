#!/bin/bash

# Ensure required environment variables are set
if [[ -z "$INJECT_MANIFEST" || -z "$CHAOS_DURATION" || -z "$REVERT_MANIFEST" ]]; then
  echo "Error: INJECT_MANIFEST, CHAOS_DURATION, and REVERT_MANIFEST must be set."
  exit 1
fi

# Apply the chaos injection manifest
kubectl apply -f "$INJECT_MANIFEST" || { echo "Failed to apply INJECT_MANIFEST"; exit 1; }
echo "[Inject]: Chaos injected successfully"

echo "[Wait]: Waiting for the chaos duration"
# Wait for the specified chaos duration
sleep "$CHAOS_DURATION"

# Apply the revert manifest to restore the system
kubectl apply -f "$REVERT_MANIFEST" || { echo "Failed to apply REVERT_MANIFEST"; exit 1; }
echo "[Revert]: Chaos reverted successfully"

echo "Chaos experiment completed successfully."
