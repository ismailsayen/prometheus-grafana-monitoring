#!/bin/bash

echo "🚀 Starting load tests..."

# Case 1: GET on http://localhost:8080/ (100 times)
echo "--- Case 1: GET / (port 8080) ---"
for i in {1..100}; do
    curl -s -o /dev/null http://localhost:8080/
done
echo "✅ Case 1 finished (100 requests)."

# Case 2: POST on http://localhost:8080/ (200 times)
echo "--- Case 2: POST / (port 8080) ---"
for i in {1..200}; do
    curl -s -o /dev/null -X POST http://localhost:8080/
done
echo "✅ Case 2 finished (200 requests)."

# Case 3: POST on http://localhost:3000/api/billing with JSON body (300 times)
echo "--- Case 3: POST /api/billing (port 3000) with JSON ---"
for i in {1..232}; do
    curl -s -o /dev/null -X POST http://localhost:3000/api/billing \
         -H "Content-Type: application/json" \
         -d '{"user_id":"55","number_of_items":"5445","total_amount":"5416"}'
done
echo "✅ Case 3 finished (300 requests)."

# Case 4: GET on http://localhost:3000/api/billing (600 times)
echo "--- Case 4: GET /api/billing (port 3000) ---"
for i in {1..567}; do
    curl -s -o /dev/null http://localhost:3000/api/billing
done
echo "✅ Case 4 finished (600 requests)."

# Case 5: POST on http://localhost:3000/api/movies with JSON body (300 times)
echo "--- Case 5: POST /api/movies (port 3000) with JSON ---"
for i in {1..287}; do
    curl -s -o /dev/null -X POST http://localhost:3000/api/movies \
         -H "Content-Type: application/json" \
         -d '{"title":"drrrrrrrrrr","description":"good movie"}'
done
echo "✅ Case 5 finished (300 requests)."

# Case 6: GET on http://localhost:3000/api/movies (600 times)
echo "--- Case 6: GET /api/movies (port 3000) ---"
for i in {1..543}; do
    curl -s -o /dev/null http://localhost:3000/api/movies
done
echo "✅ Case 6 finished (600 requests)."

echo "🎉 All tests are completed! You can check your metrics in Prometheus/Grafana."