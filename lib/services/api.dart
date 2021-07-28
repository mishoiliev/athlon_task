import 'package:athlon_task/constants/user.dart';

class AuthService {
  //return id of user and message of request
  static Map<String, dynamic> login(String email, String password) {
    if (email == user['email']) {
      if (password == user['password']) {
        return {
          'id': user['id'],
          'message': 'Successful',
        };
      } else {
        return {
          'id': 0,
          'message': 'Password is not correct',
        };
      }
    } else
      return {
        'id': 0,
        'message': 'User does not exist',
      };
  }
}

class ProfileService {
  static Map<String, dynamic> getUserInfo(int id) {
    print('Getting user info');
    if (id == user['id']) {
      return {
        'email': user['email'],
        'password': user['password'],
        'image': user['image'],
        'dateCreated': new DateTime.now(),
      };
    } else
      return {};
  }
}
