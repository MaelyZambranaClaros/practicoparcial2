import 'package:flutter/material.dart';
import 'package:practicoparcial2/addstudent.dart';
import 'package:practicoparcial2/login.dart';
import 'package:practicoparcial2/studentlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(PracticoParcial2());
}

class PracticoParcial2 extends StatelessWidget {
  const PracticoParcial2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practico Parcial 2',
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student List:",
          style: TextStyle(color: Colors.pink),
        ),
        leading: Icon(
          Icons.account_circle_outlined,
          color: Colors.pink,
          size: 30.0,
        ),
        backgroundColor: Colors.white,
        actions: [
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              // ignore: deprecated_member_use
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.pink)),
          )
        ],
      ),
      body: Center(
        child: StudentsListView(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        label: Text('Add'),
        icon: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudent()),
          );
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
