import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginTextField(String type) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(type),
      SizedBox(
        height: 10,
      ),
      TextField(
        keyboardType: TextInputType.emailAddress,
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: type == 'Email' ? 'example@email.com' : 'password',
        ),
        onChanged: null,
      ),
    ],
  );
}
