# Changes compared to builtin `fg`:
# - accepts a given number as the job id directly. E.g. `fg 1` instead of `fg %1`.
# - accepts `-` to switch to the previous active job
function fg --description "new `fg`"
    set --local jobid $argv[1]
    if test -z "$jobid"
        builtin fg $argv
    else
        switch $jobid
            case "-" # fg -
                set --local proc (builtin jobs --group)[1..2]
                if set --query proc[1]
                    builtin fg $proc[-1]
                else
                    return 1
                end
            case "*" # fg ID
                if string match --quiet --regex "^[0-9]+\$" -- $jobid
                    builtin jobs --pid %$jobid --quiet
                    if test $status -eq 0
                        set --local pid (builtin jobs --pid %$jobid)
                        builtin fg $pid
                    else
                        echo "Job with ID $jobid does not exist."
                    end
                else
                    builtin fg $argv
                end
        end
    end
end
