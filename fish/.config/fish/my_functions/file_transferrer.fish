function file_transferrer
    set token (gcloud auth print-identity-token)

    set response (curl -m 3610 -X POST https://europe-west1-vf-gr-datamov-beta.cloudfunctions.net/file_transferrer \
    -H "Authorization: bearer $token" \
    -H "Content-Type: application/json" \
    -d @$argv)

    set_color green
    echo -e "\n $response"
    set_color normal
end
