format PE GUI 4.0
entry start

include 'win32a.inc'

section '.data' data readable writeable
    hWnd dd ?

section '.code' code readable executable
start:
    main_loop:
        call [GetForegroundWindow]
        mov [hWnd], eax

        push 0
        push [hWnd]
        call [EnableWindow]

        push 0x0002
        push 1
        push 1
        push 0
        push 0
        push 1
        push [hWnd]
        call [SetWindowPos]

        push 100
        call [Sleep]

        jmp main_loop

section '.idata' import data readable
    library kernel32, 'kernel32.dll', \
            user32,   'user32.dll'

    import kernel32, \
           Sleep, 'Sleep'

    import user32, \
           GetForegroundWindow, 'GetForegroundWindow', \
           EnableWindow, 'EnableWindow', \
           SetWindowPos, 'SetWindowPos'