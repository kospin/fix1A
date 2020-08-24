IF PCount() == 1
    PARAMETERS v1
    words := ""
    IF checkfile()
        savefile() 
    ENDIF
ENDIF
FUNCTION checkfile()
    nHread := FOpen( v1 )
    cBuffer := Space( 128 )
    l := FRead( nHread, @cBuffer, 128 )
    DO WHILE l = 128
        words := words + cBuffer
        cBuffer := Space( 128 )
        l := FRead( nHread, @cBuffer, 128 )
    ENDDO
    FClose( nHread )
    words := words + Left( cBuffer, l )
        
RETURN Asc( Right( words,1 ))==26  
PROCEDURE savefile()
    save = Left( words, Len( words ) - 3 )
    nHWrite :=FCreate( v1 )
    FWrite(nHwrite,"",0) 
    FWrite(nHwrite,save) 
    FClose( nHwrite )
    ?"Done"
RETURN