set confirm off
set verbose off

# These make gdb never pause in its output
set height 0
set width 0

# Save command history
set history save on
set history expansion on

# Breakpoint aliases
define bpl
    info breakpoints
end
document bpl
List all breakpoints.
end

define bp
    if $argc != 1
        help bp
    else
        break $arg0
    end
end
document bp
Set breakpoint.
Usage: bp LOCATION
LOCATION may be a line number, function name, or "*" and an address.

To break on a symbol you must enclose symbol name inside "".
Example:
bp "[NSControl stringValue]"
Or else you can use directly the break command (break [NSControl stringValue])
end

define bpc
    if $argc != 1
        help bpc
    else
        clear $arg0
    end
end
document bpc
Clear breakpoint.
Usage: bpc LOCATION
LOCATION may be a line number, function name, or "*" and an address.
end

define bpx
    if $argc != 1
        help bpx
    else
        delete $arg0
    end
end
document bpx
Delete breakpoint with number NUM.
Usage: bpx NUM
end

define bpe
    if $argc != 1
        help bpe
    else
        enable $arg0
    end
end
document bpe
Enable breakpoint with number NUM.
Usage: bpe NUM
end

define bpd
    if $argc != 1
        help bpd
    else
        disable $arg0
    end
end
document bpd
Disable breakpoint with number NUM.
Usage: bpd NUM
end

define bpt
    if $argc != 1
        help bpt
    else
        tbreak $arg0
    end
end
document bpt
Set a temporary breakpoint.
Will be deleted when hit!
Usage: bpt LOCATION
LOCATION may be a line number, function name, or "*" and an address.
end

define bps
  save breakpoints .gdb_bps
end
document bps
Save current breakpoints into .gdb_bps.
end

define bpr
  source .gdb_bps
end
document bpr
Read breakpoints from .gdb_bps.
end
