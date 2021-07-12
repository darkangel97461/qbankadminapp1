import 'package:flutter/material.dart';
import 'package:qbankadminapp/components/constants.dart';

class RepeatedQuestions extends StatefulWidget {
  @override
  _RepeatedQuestionsState createState() => _RepeatedQuestionsState();
}

class _RepeatedQuestionsState extends State<RepeatedQuestions> {
  void clearEverything() {
    _questionEditingController.clear();
    _pagenoEditingController.clear();
    _editionEditingController.clear();
    _textbookEditingController.clear();
    _noofrepetitionEditingController.clear();
    _yearsofrepetitionEditingController.clear();
  }

  TextEditingController _questionEditingController = TextEditingController();
  TextEditingController _yearsofrepetitionEditingController =
      TextEditingController();
  TextEditingController _noofrepetitionEditingController =
      TextEditingController();
  TextEditingController _textbookEditingController = TextEditingController();
  TextEditingController _editionEditingController = TextEditingController();
  TextEditingController _pagenoEditingController = TextEditingController();
  bool newAnswer = false;
  String year = "1st Year";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
          elevation: 0.0,
          title: Text("Add Repeated Questions"),
          backgroundColor: Colors.transparent),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Select Year",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            trailing: DropdownButton<String>(
              iconEnabledColor: Colors.white,
              elevation: 2,
              value: year,
              dropdownColor: buttonColor,
              style: TextStyle(color: Colors.white),
              onChanged: (String? value) {
                print(value);
                setState(() {
                  year = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text("1st Year"),
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  value: '1st Year',
                ),
                DropdownMenuItem(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text("2nd Year"),
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  value: '2nd Year',
                ),
                DropdownMenuItem(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text("3rd Year"),
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  value: '3rd Year',
                ),
                DropdownMenuItem(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Center(child: Text("4th Year")),
                      ),
                    ],
                  ),
                  value: '4th Year',
                ),
              ],
            ),
          ),
          (year == '1st Year')
              ? NewDropDownReady()
              : (year == '2nd Year')
                  ? SecondNewDropDownReady()
                  : (year == '3rd Year')
                      ? ThirdNewDropDownReady()
                      : FourthNewDropDownReady(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Add Question",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          QuestionTextField(
            onChanged: (value) {},
            controller: _questionEditingController,
            hintText: 'Enter the Question...',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Years of Repetition",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldDecoration(
              onChanged: (value) {},
              hintText: "eg: 2011-Supply, 2011-Main, 2012-Supply...",
              controller: _yearsofrepetitionEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "How many times of repetition",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 300,
              left: 10,
            ),
            child: TextFieldDecoration(
              hintText: 'No',
              maxLength: 2,
              textInputType: TextInputType.number,
              onChanged: (String value) {},
              controller: _noofrepetitionEditingController,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Answers on the TextBook",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "TextBook 1:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldDecoration(
              onChanged: (value) {},
              hintText: "Name of the TextBook...",
              controller: _textbookEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Edition:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldDecoration(
              onChanged: (value) {},
              hintText: "No. of Edition...",
              controller: _editionEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Page No:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldDecoration(
              onChanged: (value) {},
              hintText: "Enter the Page No...",
              controller: _pagenoEditingController,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Add one more textbook",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (newAnswer == true) {
                      newAnswer = false;
                    } else {
                      newAnswer = true;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: buttonColor,
                  ),
                  child: Center(
                    child: (newAnswer)
                        ? Icon(
                            Icons.remove,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (newAnswer)
              ? Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "TextBook 2:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldDecoration(
                        onChanged: (value) {},
                        hintText: "Name of the TextBook...",
                        controller: _textbookEditingController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Edition:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldDecoration(
                        onChanged: (value) {},
                        hintText: "No. of Edition...",
                        controller: _editionEditingController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Page No:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldDecoration(
                        onChanged: (value) {},
                        hintText: "Enter the Page No...",
                        controller: _pagenoEditingController,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              : SizedBox(
                  height: 10.0,
                ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: MaterialButton(
              onPressed: () {
                if (_yearsofrepetitionEditingController.text != '' &&
                    _yearsofrepetitionEditingController.text != ' ' &&
                    _noofrepetitionEditingController.text != '' &&
                    _noofrepetitionEditingController.text != ' ' &&
                    _questionEditingController.text != '' &&
                    _questionEditingController.text != ' ') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text('Confirm'),
                        content: new Text('Proceed?'),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15)),
                        actions: <Widget>[
                          new TextButton(
                            child: new Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            onPressed: () {
                              clearEverything();
                              Navigator.pop(context);
                            },
                          ),
                          new TextButton(
                            child: Text("Cancel",
                                style: TextStyle(
                                  color: buttonColor,
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text('No Data'),
                        content: new Text(
                            'Please Check if all the feilds are filled...'),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15)),
                        actions: <Widget>[
                          new TextButton(
                            child: new Text(
                              "OK",
                              style: TextStyle(
                                color: buttonColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              height: 80,
              color: buttonColor,
              child: Text(
                "Upload",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewDropDownReady extends StatefulWidget {
  @override
  _NewDropDownReadyState createState() => _NewDropDownReadyState();
}

class _NewDropDownReadyState extends State<NewDropDownReady> {
  String defaultValue = 'Anatomy';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Select Subject",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      trailing: DropdownButton<String>(
        iconEnabledColor: Colors.white,
        elevation: 2,
        value: defaultValue,
        dropdownColor: buttonColor,
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          print(value);
          setState(() {
            defaultValue = value!;
          });
        },
        items: [
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Anatomy'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Anatomy',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Physiology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Physiology',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Biochemistry'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Biochemistry',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Biomechanics'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Biomechanics',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Psychology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Psychology',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Sociology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Sociology',
          ),
        ],
      ),
    );
  }
}

class SecondNewDropDownReady extends StatefulWidget {
  @override
  _SecondNewDropDownReadyState createState() => _SecondNewDropDownReadyState();
}

class _SecondNewDropDownReadyState extends State<SecondNewDropDownReady> {
  String defaultValue = 'Pathology';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Select Subject",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      trailing: DropdownButton<String>(
        iconEnabledColor: Colors.white,
        elevation: 2,
        value: defaultValue,
        dropdownColor: buttonColor,
        style: TextStyle(color: Colors.white),
        onChanged: (String? value) {
          print(value);
          setState(() {
            defaultValue = value!;
          });
        },
        items: [
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Pathology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Pathology',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Microbiology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Microbiology',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Exercisetherapy'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Excercisetherapy',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Electrotherapy'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Electrotherapy',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Pharmacology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Pharmacology',
          ),
        ],
      ),
    );
  }
}

class ThirdNewDropDownReady extends StatefulWidget {
  @override
  _ThirdNewDropDownReadyState createState() => _ThirdNewDropDownReadyState();
}

class _ThirdNewDropDownReadyState extends State<ThirdNewDropDownReady> {
  String defaultValue = 'General Medicine';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Select Subject",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      trailing: DropdownButton<String>(
        iconEnabledColor: Colors.white,
        elevation: 2,
        value: defaultValue,
        dropdownColor: buttonColor,
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          print(value);
          setState(() {
            defaultValue = value!;
          });
        },
        items: [
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('General Medicine'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'General Medicine',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('General Surgery'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'General Surgery',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Orthopedics & Traumatology'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Orthopedics & Traumatology',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Orthopedics and Sports Physiotherapy'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Orthopedics & Sports Physiotherapy',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Cardio Respiratory'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Cardio Respiratory',
          ),
        ],
      ),
    );
  }
}

class FourthNewDropDownReady extends StatefulWidget {
  @override
  _FourthNewDropDownReadyState createState() => _FourthNewDropDownReadyState();
}

class _FourthNewDropDownReadyState extends State<FourthNewDropDownReady> {
  String defaultValue = 'Neurology and Neurosurgery';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Select Subject",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      trailing: DropdownButton<String>(
        iconEnabledColor: Colors.white,
        elevation: 2,
        value: defaultValue,
        dropdownColor: buttonColor,
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          print(value);
          setState(() {
            defaultValue = value!;
          });
        },
        items: [
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Neurology and Neurosurgery'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Neurology and Neurosurgery',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Neurophysiotherapy'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Neurophysiotherapy',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Community Medicine'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Community Medicine',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Community Based Rehabilitation'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Community Based Rehabilitation',
          ),
          DropdownMenuItem(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text('Research Methodology and Biostatics'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
            value: 'Research Methodology and Biostatics',
          ),
        ],
      ),
    );
  }
}
