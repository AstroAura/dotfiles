function fish_prompt
    # Colors
    set -l normal (set_color normal)
    set -l arch_blue (set_color 1793D1)
    set -l arch_light_blue (set_color 6FCFEB)
    set -l green (set_color green)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    
    # Arch logo
    echo -n "$arch_blue$normal "
    
    # Battery status (if available)
    if type -q acpi
        set -l battery_info (acpi -b 2>/dev/null)
        if test $status -eq 0
            set -l battery_percent (echo $battery_info | grep -oE '[0-9]+%')
            set -l battery_status (echo $battery_info | grep -oE '(Charging|Discharging|Full|Unknown)')
            
            switch $battery_status
                case Charging
                    echo -n "$green󰂄$normal "
                case Discharging
                    if test (echo $battery_percent | tr -d '%') -lt 20
                        echo -n "$red󰂃$normal "
                    else if test (echo $battery_percent | tr -d '%') -lt 50
                        echo -n "$yellow󰂁$normal "
                    else
                        echo -n "$green󰂀$normal "
                    end
                case Full
                    echo -n "$green󰂅$normal "
                case '*'
                    echo -n "$white󰂑$normal "
            end
            echo -n "$battery_percent "
        end
    end
 
    # Date 
    set_color magenta
    echo -n " "(date "+%a %d %b")" "
 
    # Current time
    set -l current_time (date "+%H:%M")
    echo -n "$magenta󰅐$normal $current_time "
     # Memory usage with actual numbers
    set -l memory_used (free -h | awk '/Mem:/ {print $3}')
    set -l memory_total (free -h | awk '/Mem:/ {print $2}')
    set -l memory_percent (free | awk '/Mem:/ {printf "%.1f", $3/$2*100}')
    
    if test $memory_percent -gt 80
        echo -n "$red󰍛$normal $memory_used/$memory_total "
    else if test $memory_percent -gt 60
        echo -n "$yellow󰍛$normal $memory_used/$memory_total "
    else
        echo -n "$green󰍛$normal $memory_used/$memory_total "
    end
    
    # Storage usage with actual numbers
    set -l storage_used (df -h / | awk 'NR==2 {print $3}')
    set -l storage_total (df -h / | awk 'NR==2 {print $2}')
    set -l storage_free (df -h / | awk 'NR==2 {print $4}')
    set -l storage_percent (df / | awk 'NR==2 {print $5}' | tr -d '%')
    
    if test $storage_percent -gt 90
        echo -n "$red󰋊$normal $storage_used/$storage_total "
    else if test $storage_percent -gt 80
        echo -n "$yellow󰋊$normal $storage_free free "
    else
        echo -n "$green󰋊$normal $storage_free free "
    end

    # CPU usage
    set -l cpu_usage (ps -A -o %cpu | awk '{s+=$1} END {printf "%.1f%%", s}')
    echo -n "$cyan󰻠$normal $cpu_usage "
    
    # Current directory and prompt
    echo -n "$white"(prompt_pwd)"$normal"
    echo -n " \$ "
end
