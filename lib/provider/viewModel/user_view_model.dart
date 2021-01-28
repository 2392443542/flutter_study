import 'package:flutter/cupertino.dart';
import '../model/user_info.dart';
class UserViewModel extends ChangeNotifier {

  UserInfo _info;
  UserViewModel(this._info);
  UserInfo get info => _info;

set info(UserInfo value) {
    _info = value;
    notifyListeners();
  }


}