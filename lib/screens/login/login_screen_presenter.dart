import 'package:flutter_login_page_ui/data/rest_ds.dart';
import 'package:flutter_login_page_ui/models/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {

    api.login(username, password).then((User user) {
      _view.onLoginSuccess(user);
    }, onError: (e) {
      _view.onLoginError("Email or Password isn't correct!");
    }).catchError((Exception error) => _view.onLoginError(error.toString()));
  }


}