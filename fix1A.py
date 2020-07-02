import sys
def q(say):
    print(say)
    exit()
if len(sys.argv)<=1:
    q("錯誤:無指定檔名")
with open(sys.argv[1],"rt") as fin:
    str=fin.read()
    lines=str.split('\n')
    if ord(lines[len(lines)-1][0])==26:
        del lines[len(lines)-1]
        fout =open(sys.argv[1],"wt")
        for l in lines:
            if l!=lines[len(lines)-1]:
                fout.write(l+'\n')
            else:
                fout.write(l)
        q("修正完成")
    else:
        q("不需更動")