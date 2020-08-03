# fix1A

修正輸出文字檔尾換行和eof

## 問題

dbase資料庫經copy to輸出文字檔後在檔尾多了0D0A1A三個字元導致銀行軟體無法正常操作

## 方案

0D0A是換行字元  
1A是EOF字元  
那就把檔尾的換行和多出的一碼清掉就好了

### C++

重弄,stringstream 看不到1A  
出現兩個10,丟掉後回存

`fix1A.exe 123.txt`  

### Python

~~換行切片~~讀string,如果最後一~~行~~字是1A(26)就~~刪掉~~  
~~輸出,最後一行不送出換行~~去尾2元素(0D0A看作1字)  

`python fix1A.py 123.txt`

### Go

~~換行切片,如果最後長度小於等於1就縮尾1  
輸出,最後一行不送出換行~~  
讀bytelist,如果最後是26就縮尾3元素存回

`fix1A.exe 123.txt`

### java

~~行取再合併,如果長度<=1就跳過  
最後trim去尾換行~~  
啊就直接讀完trim去尾就好了  
**加上判斷26再存檔**

`java.exe Fix1A.java 123.txt`

### delphi(lazarus)

Tstringlist讀完,若尾行為空,trim去尾回存

`fix1A.exe 123.txt`

### dart

讀bytes陣  
若可移除1A(26)就再縮尾2元素

`dart.exe Fix1A.dart 123.txt`

### Ruby

讀檔,判尾跳行則回存strip

`ruby fix1A.rb 123.txt`

### kotlin

readbytes如果最後元素為26就縮尾3元素存回

`java -jar Fix1A.jar 123.txt`

### AutoIt

全notepad自動化...  
notepad開檔若選取尾碼為26則從檔尾backspace兩次,存檔,離開

`fix1A.exe 123.txt`

### PowerShell

(Encode部份版本5和6,7不相容;最後還是測試出一組參數)  
讀檔,若檔尾為26則不存尾3碼  
win10內建要先開未簽名脚本執行權限

`set-executionpolicy remotesigned`

`./fix1A.ps1 123.txt`

### QuickBasic

檢查檔尾26若有則行取加換行合併  
最後一行不加換行寫回

`FIX1A 123.TXT`

### Rust

讀檔若pop出26就再pop2次!! 回存

`fix1A.exe 123.txt`

### VB.Net

讀檔若尾26則不取後3碼入陣存回

`fix1A.exe 123.txt`

---

## 還有嗎

+ 檢查? byte查數字,string查長度,stringlist查空行
+ trim很好用
+ list [:]超方便
+ 0D0A是一字還兩字?以前是用text或byte看,現在好像用encode解決
+ encode,decode,utf8,utf16,utf32,ascii,latin1 還好其實可以不處理big5
+ 從 **讀-->修-->判-->寫** 到 **讀-->判--寫(修)** 到 **判(讀)-->寫(修)** 能不能到 **寫(修(判(讀)))** ?
+ AutoIt開資料庫自動key單...如何?
+ Rust!!快速!安全!高效平行運算! 卻有著打槍**而且不知道為什麼打槍**最多次的編譯器...巨集? 所有權? 參考? 借用? 以前分call by value, call by references, call by address還不夠用嗎?
