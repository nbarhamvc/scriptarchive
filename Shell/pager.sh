#!/bin/bash
# Script makes use of httpie, jq, Python pip & veracode-api-signing library per https://docs.veracode.com/r/t_install_api_authen
# Credit to Ben Halpern for this
# Enter Base URL of the API endpoint, e.g:
BASE_URL="https://api.veracode.com/appsec/v1/applications"
# Initial page number
page_number=0
# Specify output directory for API results
out_dir="apiresults"

if [ -d "$out_dir" ]; then
    echo "directory exists"
    cd "$out_dir/"
    pwd
else
    echo "Making directory"
    mkdir $out_dir
    cd "$out_dir/"
    pwd
fi

# Function to make the API call and process the response
make_api_call() {
  local page=$1
# Customize call 
  http --auth-type veracode_hmac "$BASE_URL?size=5&published_scasns_only=false&page=$page" -o analyses-$page.json
  response=$(cat analyses-$page.json )

  # Extract total_pages, total_elements, and number from the response
  total_pages=$(cat analyses-$page.json | jq -r '.page.total_pages' )
  total_elements=$(cat analyses-$page.json | jq -r '.page.total_elements' )
  current_page=$(cat analyses-$page.json | jq -r '.page.number' )
  
  # Return total_pages for further use
  echo $total_pages


}

# Main loop to handle pagination
while true; do
  total_pages=$( make_api_call $page_number)
  echo "Page number: $page_number"
  # Check if we have more pages to fetch
  if [[ $((page_number + 1)) -lt $total_pages ]]; then
    page_number=$(( page_number + 1 ))
  else
    break
  fi
done

echo "All pages fetched."
