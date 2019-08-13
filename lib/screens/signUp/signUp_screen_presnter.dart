import 'package:flutter_login_page_ui/data/rest_ds.dart';
import 'package:flutter_login_page_ui/models/user.dart';

abstract class SignUpScreenContract {
  void onSignUpSuccess(User user);
  void onSignUpError(String errorTxt);
}

class SignUpScreenPresenter {
  SignUpScreenContract _view;
  RestDatasource api = new RestDatasource();
  SignUpScreenPresenter(this._view);

  doSignUp(Map<String,String> body) {

    api.signUp(body).then((User user) {
      _view.onSignUpSuccess(user);
    }).catchError((Exception error) => _view.onSignUpError(error.toString()));
  }
}