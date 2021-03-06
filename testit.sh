#!/usr/bin/env bash

set -euf

echo "Running..."

seq 1 "$1" | xargs -n1 -P4 bash -c "curl -s -S --request PUT \
  --url http://localhost:4000/api/secret_agents/1 \
  --header 'accept: application/json' \
  --header 'content-type: application/json' \
  --data '{
                \"name\": \"James Bond\",
                \"disavowed\": false,
                \"covers\": [
                        {
                                \"id\": 3,
                                \"code_name\": \"Flying Panda\",
                                \"name\": \"John Doe\",
                                \"temp_info\": null
                        },
                        {
                                \"id\": 4,
                                \"code_name\": \"Psychic Tiger\",
                                \"name\": \"Big Willy Bristol\",
                                \"temp_info\": null
                        }
                ]
}' | grep -i \"error\""

echo "All Done!"
