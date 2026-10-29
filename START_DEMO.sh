#!/usr/bin/env bash
# Starts a tiny local web server so the camera and the offline AI work reliably.
cd "$(dirname "$0")" || exit 1
PORT=8765
python3 -m http.server "$PORT" >/dev/null 2>&1 &
PID=$!
trap 'kill $PID 2>/dev/null' EXIT INT TERM
sleep 1
if ! kill -0 "$PID" 2>/dev/null; then
  echo "Port $PORT is already in use. Another demo server is probably still running."
  echo "Close it (Ctrl+C in its window), then run this again."
  exit 1
fi
URL="http://localhost:$PORT/AI_Item_Check_Demo.html"
(xdg-open "$URL" || open "$URL") >/dev/null 2>&1 || echo "Open this address in Chrome: $URL"
echo "AI item demo running at $URL"
echo "Press Ctrl+C to stop."
wait "$PID"
