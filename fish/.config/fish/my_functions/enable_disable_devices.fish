function enable_disable_devices
    if test (count $argv) -ne 2
        echo "Usage: enable_disable_devices <v1>(id) <v2>(0 or 1)"
        return 1
    end
    set v1 $argv[1]
    set v2 $argv[2]
    xinput set-prop $v1 "Device Enabled" $v2
end
