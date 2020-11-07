import 'package:flutter/material.dart';
import 'student.dart';
import 'package:practicoparcial2/api.dart';
import 'dart:core';

class EditStudent extends StatelessWidget {
  Student student;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  EditStudent(this.student);

  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Student",
          style: TextStyle(color: Colors.pink[300]),
        ),
        backgroundColor: Colors.pink[50],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.pink[300],
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0)),
                  Icon(
                    Icons.person,
                    color: Colors.pink[50],
                    size: 50.0,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.5, vertical: 5),
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(1)),
                      ],
                    ),
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.pink[300],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.pink[50],
                              size: 50.0,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.pink[50],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: firstName,
                            decoration: InputDecoration(
                              labelText: "Enter your name",
                              labelStyle: TextStyle(
                                color: Colors.pink[50],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.navigate_next_rounded,
                              size: 50.0,
                              color: Colors.pink[50],
                            ),
                            Text(
                              "Last name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.pink[50],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: lastName,
                            decoration: InputDecoration(
                              labelText: "Enter your last name",
                              labelStyle: TextStyle(
                                color: Colors.pink[50],
                              ),
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pink[50],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {
                  Student newStudent = Student.newStudent(
                    50,
                    lastName.text,
                    firstName.text,
                    DateTime.now(),
                  );
                  apiServices.putStudent(student.studentID, newStudent);
                  Navigator.pop(context);
                },
                color: Colors.pink[50],
                splashColor: Colors.pink[300],
                child: Text(
                  "Edit Student",
                  style: TextStyle(
                    color: Colors.pink[300],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
