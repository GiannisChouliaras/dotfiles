function cf_logs
    if test (count $argv) -ne 1
        echo "Usage: log_cloud_function <v1>(cloud functions name)"
        return 1
    end
    set v1 $argv[1]
    gcloud functions logs read $v1 --region europe-west1 --limit 100 --format='json' | jq .
end
