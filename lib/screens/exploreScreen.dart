import 'package:athlon_task/customWidgets/loginTextFields.dart';
import 'package:athlon_task/providers/profileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'You are not logged in',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 60),
            loginTextField('Email'),
            SizedBox(height: 30),
            //Since we are reusing buttons, we can create custom ones
            loginTextField('Password'),
            Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text('Change'),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Log In'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
