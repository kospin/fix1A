import sys


def q(say):
    print(say)
    exit()


if len(sys.argv) <= 1:
    q("錯誤:無指定檔名")
with open(sys.argv[1], "rt") as fin:
    str = fin.read()
    if ord(str[-1]) == 26:
        open(sys.argv[1], "wt").write(str[:-2])
        q("修正完成")
    else:
        q("不需更動")
