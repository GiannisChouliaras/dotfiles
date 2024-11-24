function git-set-remote
    if test (count $argv) -ne 2
        echo "Usage: git-set-remote <v1> <v2>"
        return 1
    end
    set v1 $argv[1]
    set v2 $argv[2]
    git remote set-url origin https://ioannis-chouliaras:$v1@$v2
end
