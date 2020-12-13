
import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool stateValue){
    _busy = stateValue;
    notifyListeners();
  }

}