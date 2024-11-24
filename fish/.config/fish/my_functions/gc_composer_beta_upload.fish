function composer_beta_upload
    if test (count $argv) -eq 1
        gcloud storage cp $argv[1] gs://vf-gr-datamov-beta-composer/dags/$argv[1]
    else
        echo "Usage: composer_beta_upload <filename>"
    end
end
