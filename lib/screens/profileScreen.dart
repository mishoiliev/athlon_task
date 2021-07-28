import 'package:athlon_task/providers/loginProvider.dart';
import 'package:athlon_task/providers/profileProvider.dart';
import 'package:athlon_task/screens/logInScreen.dart';
import 'package:athlon_task/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String convertDateTimeToTime(DateTime timestamp) {
    String month = timestamp.month.toString();
    switch (month) {
      //we would have cases for each month here,
      //for simplicity it is only for Jul and Aug
      case '7':
        {
          month = 'Jul';
          break;
        }
      case '8':
        {
          month = 'Aug';
          break;
        }
      default:
        {
          month = 'Jan';
          break;
        }
    }
    return month +
        ' ' +
        timestamp.day.toString() +
        ' ' +
        timestamp.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Avatar',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/images/user.png'),
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selfie.png'),
                      SizedBox(height: 14),
                      Text(
                        'Uploaded ' +
                            convertDateTimeToTime(Provider.of<ProfileProvider>(
                                    context,
                                    listen: false)
                                .dateCreated),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email'),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: Provider.of<ProfileProvider>(context).email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: Provider.of<ProfileProvider>(context).email,
                  ),
                  // onChanged: () {},
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Password'),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: Provider.of<ProfileProvider>(context).password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: Provider.of<ProfileProvider>(context).password,
                  ),
                  // onChanged: () {},
                ),
              ],
            ),
            TextButton(onPressed: () {}, child: Text('Change')),
            // SizedBox(height: double.infinity),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),
                        (route) => false,
                      );
                    },
                    child: Text('Log Out'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Colors.blueAccent),
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
