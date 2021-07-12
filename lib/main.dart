import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qbankadminapp/components/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qbankadminapp/screen/dictionary.dart';
import 'package:qbankadminapp/screen/repeated_question.dart';
import 'package:qbankadminapp/screen/topicwise_question.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _userEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        elevation: 0.00,
        title: Text(
          "QB App Admin Panel",
        ),
        backgroundColor: Color(0xff212121),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _userEditingController,
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      decoration: kUserInputDecoration,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordEditingController,
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      decoration: kPasswordInputDecoration,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
              MaterialButton(
                elevation: 2,
                color: buttonColor,
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_userEditingController.text == "4c" &&
                      _passwordEditingController.text == "fghFGH123!@#") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewScreen()),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Wrong Credentials",
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        elevation: 0.00,
        title: Text(""),
        backgroundColor: Color(0xff212121),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RepeatedQuestions(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * .7
                      : MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD",
                          style: GoogleFonts.roboto(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Repeated Questions",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicWiseQuestions(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * .7
                      : MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD",
                          style: GoogleFonts.roboto(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textgap,
                        Text(
                          "Topic-Wise Questions",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dictionary(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * .7
                      : MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD",
                          style: GoogleFonts.roboto(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textgap,
                        Text(
                          "Dictionary Words and Meanings",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
