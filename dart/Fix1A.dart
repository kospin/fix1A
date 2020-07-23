import 'dart:io';

void main(List<String> args){
  var f = new File(args[0]);
  var b = f.readAsBytesSync();
  List<int> cl =[];
  cl.addAll(b);
  if (cl.remove(26)){
    cl.removeLast();
    cl.removeLast();
  }  
  new File(args[0]).writeAsBytesSync(cl);
}