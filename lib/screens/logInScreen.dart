import 'package:athlon_task/providers/loginProvider.dart';
import 'package:athlon_task/providers/profileProvider.dart';
import 'package:athlon_task/screens/exploreScreen.dart';
import 'package:athlon_task/screens/profileScreen.dart';
import 'package:athlon_task/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obscureText = true;
  String _email;
  String _password;
  String _message = '';
  Map<String, dynamic> _loginInfo;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _errorMessage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            _message,
            style: TextStyle(color: Colors.red),
          ),
        ),
        if (_message != '') SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email'),
                  SizedBox(height: 5),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'example@email.com',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password'),
                  SizedBox(height: 5),
                  Stack(
                    alignment: Alignment(1, 1),
                    children: [
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'password',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                          onPressed: _toggleObscureText)
                    ],
                  ),
                ],
              ),
              if (_message != 'Successful') _errorMessage(),
              Container(
                width: double.infinity,
                height: 50,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.blue),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      _loginInfo = AuthService.login(_email, _password);
                      _message = _loginInfo['message'];
                    });
                    // Check if user is found
                    // if the id returned is 0, then user does not exist
                    if (_loginInfo['id'] != 0) {
                      Provider.of<LoginProvider>(context, listen: false)
                          .setUserLoggedIn(
                        true,
                        _loginInfo['id'],
                      );
                      //Go to profile screen and remove login from route
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                        (route) => false,
                      );
                      //Save the user info in provider, so we can display it
                      //on profile sceen
                      Map<String, dynamic> _userInfo =
                          ProfileService.getUserInfo(
                              Provider.of<LoginProvider>(context, listen: false)
                                  .id);
                      Provider.of<ProfileProvider>(context, listen: false)
                          .setUserLoggedIn(
                        _userInfo['email'],
                        _userInfo['password'],
                        _userInfo['profileImage'],
                        _userInfo['dateCreated'],
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Forgot Password'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ExploreScreen()),
                  );
                },
                child: Text(
                  'Explore The App',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w900),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Colors.white,
                  elevation: 0,
                  side: BorderSide(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
