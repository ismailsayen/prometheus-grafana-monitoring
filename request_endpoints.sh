#!/bin/bash

echo "🚀 Début des tests de charge..."

# Cas 1 : GET sur http://localhost:8080/ (100 fois)
echo "--- Cas 1 : GET / (port 8080) ---"
for i in {1..100}; do
    curl -s -o /dev/null http://localhost:8080/
done
echo "✅ Cas 1 terminé (100 requêtes)."

# Cas 2 : POST sur http://localhost:8080/ (100 fois)
echo "--- Cas 2 : POST / (port 8080) ---"
for i in {1..200}; do
    curl -s -o /dev/null -X POST http://localhost:8080/
done
echo "✅ Cas 2 terminé (100 requêtes)."

# Cas 3 : POST sur http://localhost:3000/api/billing avec corps JSON (100 fois)
echo "--- Cas 3 : POST /api/billing (port 3000) avec JSON ---"
for i in {1..300}; do
    curl -s -o /dev/null -X POST http://localhost:3000/api/billing \
         -H "Content-Type: application/json" \
         -d '{"user_id":"55","number_of_items":"5445","total_amount":"5416"}'
done
echo "✅ Cas 3 terminé (100 requêtes)."

# Cas 4 : GET sur http://localhost:3000/api/billing (100 fois)
echo "--- Cas 4 : GET /api/billing (port 3000) ---"
for i in {1..600}; do
    curl -s -o /dev/null http://localhost:3000/api/billing
done
echo "✅ Cas 4 terminé (100 requêtes)."

echo "🎉 Tous les tests sont terminés ! Tu peux vérifier tes compteurs dans Prometheus/Grafana."