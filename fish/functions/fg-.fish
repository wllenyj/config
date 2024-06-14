function fg-
    set -l proc (jobs -g)[1..2]
    set -q proc[1]
    or return 1

    fg $proc[-1]
end
