function fish_prompt
    # This prompt shows:
    # - green lines if the last return command is OK, red otherwise
    # - your user name, in red if root or yellow otherwise
    # - your hostname, in cyan if ssh or blue otherwise
    # - the current path (with prompt_pwd)
    # - date +%X
    # - the current virtual environment, if any
    # - the current git status, if any, with fish_git_prompt
    # - the current battery state, if any, and if your power cable is unplugged, and if you have "acpi"
    # - current background jobs, if any

    # It goes from:
    # ┬─[nim@Hattori:~]─[11:39:00]
    # ╰─>$ echo here

    # To:
    # ┬─[nim@Hattori:~/w/dashboard]─[11:37:14]─[V:django20]─[G:master↑1|●1✚1…1]─[B:85%, 05:41:42 remaining]
    # │ 2    15054    0%    arrêtée    sleep 100000
    # │ 1    15048    0%    arrêtée    sleep 100000
    # ╰─>$ echo there

    set -l retc red
    set -l ret_num $status
    test $ret_num = 0; and set retc white

    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    function _nim_prompt_wrapper
        set retc $argv[1]
        set -l field_name $argv[2]
        set -l field_value $argv[3]

        #set_color normal
        set_color $retc
        #echo -n '─'
        #echo -n ' '
        set_color normal
        set_color white 
        echo -n '['
        #set_color normal
        test -n $field_name
        and echo -n $field_name:
        set_color -o $retc
        echo -n $field_value
        set_color normal
        set_color white 
        echo -n ']'
    end

    #set_color $retc
    echo -n '┬─'
    set_color white

    # Date
    #_nim_prompt_wrapper $retc '' (date +%H:%M)
    echo -n '['
    echo -n (date +%H:%M)
    echo -n '] '

    echo -n [

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    else
        set_color green
    end

    echo -n $USER
    set_color normal
    set_color white
    echo -n @

    if test -z "$SSH_CLIENT"
        set_color green
    else
        set_color cyan
    end

    #echo -n (prompt_hostname)
    echo -n (/sbin/ifconfig | grep -w 'inet' | grep -v '127.0.0.1' | head -n 1 | awk '{print $2}')
    set_color white
    echo -n ':'
    set_color -o cyan
    echo -n (prompt_pwd)
    #echo -n (pwd)
    set_color normal
    set_color white
    echo -n ']'

    # Vi-mode
    # The default mode prompt would be prefixed, which ruins our alignment.
    function fish_mode_prompt
    end

    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        set -l mode
        switch $fish_bind_mode
            case default
                set mode (set_color --bold red)N
            case insert
                set mode (set_color --bold green)I
            case replace_one
                set mode (set_color --bold green)R
                echo '[R]'
            case replace
                set mode (set_color --bold cyan)R
            case visual
                set mode (set_color --bold magenta)V
        end
        set mode $mode(set_color normal)
        _nim_prompt_wrapper $retc '' $mode
    end


    # Virtual Environment
    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and _nim_prompt_wrapper $retc V (basename "$VIRTUAL_ENV")

    # git
    set -l prompt_git (fish_git_prompt '%s')
    test -n "$prompt_git"
    and echo -n ' '
    and _nim_prompt_wrapper white G $prompt_git

    # Battery status
    type -q acpi
    and test (acpi -a 2> /dev/null | string match -r off)
    and echo -n ' '
    and _nim_prompt_wrapper $retc B (acpi -b | cut -d' ' -f 4-)

    # New line
    echo

    # Background jobs
    set_color normal

    for job in (jobs)
        set_color white
        echo -n '│ '
        set_color brblack
        echo $job
    end

    set_color normal
    #set_color $retc
    echo -n '╰─'

    _nim_prompt_wrapper $retc '' $ret_num

    set_color -o white
    echo -n ' $ '
    set_color normal
end
