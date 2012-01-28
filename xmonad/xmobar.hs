Config { font = "xft:ProFont:pixelsize=11"
       , bgColor = "black"
       --, fgColor = "grey"
       , fgColor = "lightskyblue"
       , position = Top
       , lowerOnStart = True
       , commands = [ --Run Weather "KORD" ["-t","<station>: <tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
                      Run Weather "KORD" ["-t","O'Hare: <tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
                    --, Run Network "eth0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Network "wlan0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap ["-L","30","-H","70","--normal","yellow","--high","red","--low","green"] 10
                    , Run Battery ["-t","Batt: <left>%","-L","30","-H","70","--normal","yellow","--high","green","--low","red", "--", "-c", "energy_full"] 10 -- remove after "--" once upgraded to > xmobar > 0.14
                    , Run StdinReader
                    , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% | %cpu% | %memory% * %swap% | %wlan0% | %battery%}{ <fc=#ee9a00>%date%</fc>| %KORD% | <fc=#35D699>%uname%</fc>"
       }
