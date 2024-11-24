function data_beta_upload
    if test (count $argv) -eq 2
        gcloud storage cp $argv[1] gs://vf-gr-datamov-beta-dev-data/choul/$argv[2]/$argv[1]
    else
        echo "Usage: data_beta_upload <filename> <path-after-choul>"
    end
end
