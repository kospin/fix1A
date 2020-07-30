IF COMMAND$ = "" THEN
        PRINT "Filename ?"
        END
END IF
OPEN COMMAND$ FOR BINARY AS #2
c$ = " "
GET #2, LOF(2), c$
CLOSE 2
IF ASC(c$) = 26 THEN
        OPEN COMMAND$ FOR INPUT AS #1
        c = 0
        data$ = ""
        DO WHILE NOT EOF(1)
                INPUT #1, line$
                IF NOT EOF(1) THEN
                        data$ = data$ + line$ + CHR$(10) + CHR$(13)
                        c = c + 1
                ELSE
                        data$ = data$ + line$
                        c = c + 1
                        GOTO 1
                END IF
        LOOP
1 :
        CLOSE 1
        OPEN COMMAND$ FOR OUTPUT AS #3
        PRINT #3, data$;
        CLOSE 3
        PRINT "OK!"
END IF
END

