import 'package:flutter/material.dart';

class Checkeligibilityprovider extends ChangeNotifier{

  String _messege = "You are not to eligible to driving license!!";
  bool _check = false;

  String get messege => _messege;

  bool get check => _check;

  void checkdata(int age)
  {
    if(age>=18)
      {
        checkAge();

      }
    else
      {
        checkError();

      }

  }
  void checkAge()
  {
    _check = true;
    _messege = "You are a eligible for the driving license!!";
    notifyListeners();

  }
  void checkError(){
    _check = false;
    _messege = "You are not eligible for the driving license!!";
    notifyListeners();
  }
}