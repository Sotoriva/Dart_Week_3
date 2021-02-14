import 'package:dartweek3_backend/modules/users/view_models/user_login_model.dart';

class UserLoginModelMapper {
  final Map<String, dynamic> _requestMap;

  UserLoginModelMapper(this._requestMap);

  UserLoginModel mapper() {
    return UserLoginModel(
      _requestMap['email'],
      _requestMap['password'],
    );
  }
}
