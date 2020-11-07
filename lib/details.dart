import 'package:flutter/material.dart';
import 'api.dart';
import 'student.dart';
import 'editstudent.dart';

// ignore: must_be_immutable
class StudentDetails extends StatefulWidget {
  Student student;
  StudentDetails(this.student);
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    int id = widget.student.studentID;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Information",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.pink[300],
        child: Card(
          color: Colors.pink[50],
          child: Container(
            padding: EdgeInsets.all(10.0),
            // width: 400.0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30.0,
                      ),
                      Text(
                        'Last name: ',
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        widget.student.lastName,
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 23.0,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Column(
                    children: [
                      Text(
                        'First name: ',
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        widget.student.firstName,
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 23.0,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 30.0,
                      ),
                      Text(
                        'Student ID: ',
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        widget.student.studentID.toString(),
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 30.0,
                      ),
                      Text(
                        'Enrollment date: ',
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        widget.student.enrollmentDate.toString(),
                        style: TextStyle(
                          color: Colors.pink[300],
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(70, 50, 0, 10.0),
                  child: Row(
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditStudent(widget.student),
                            ),
                          );
                        },
                        splashColor: Colors.pink[50],
                        color: Colors.pink[300],
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      RaisedButton(
                        onPressed: () {
                          apiServices.deleteStudent(widget.student.studentID);
                          Navigator.pop(context);
                        },
                        splashColor: Colors.pink[50],
                        color: Colors.pink[300],
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.pink[50]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
