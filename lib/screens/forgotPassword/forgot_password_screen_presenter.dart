import 'package:flutter_login_page_ui/data/rest_ds.dart';
import 'package:flutter_login_page_ui/models/user.dart';

abstract class ForgotPasswordContract {
  void onForgotPasswordSuccess(String msg);
  void onForgotPasswordError(String errorTxt);
}

class ForgotPasswordPresenter {
  ForgotPasswordContract _view;
  RestDatasource api = new RestDatasource();
  ForgotPasswordPresenter(this._view);

  doForgotPassword(Map<String, String> body) {

    api.forgotPassword(body).then((String msg) {
      _view.onForgotPasswordSuccess(msg);
    }).catchError((Exception error) => _view.onForgotPasswordError(error.toString()));
  }
}