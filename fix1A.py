with open("123.txt","rt") as fin:
    str=fin.read()
    lines=str.split('\n')
    if ord(lines[len(lines)-1][0])==26:
        lines[len(lines)-1]=''
        for l in lines:
            if l:
                print(l)