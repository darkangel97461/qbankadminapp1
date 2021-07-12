import 'package:flutter/material.dart';
import 'package:qbankadminapp/components/constants.dart';

class Dictionary extends StatefulWidget {
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  void clearEverything() {
    _meaningEditingController.clear();
    _wordEditingController.clear();
  }

  TextEditingController _wordEditingController = TextEditingController();
  TextEditingController _meaningEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        elevation: 0.00,
        title: Text("Add Words"),
        backgroundColor: Color(0xff212121),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Word",
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
              hintText: "Enter the word...",
              controller: _wordEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Meaning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          QuestionTextField(
            onChanged: (value) {},
            controller: _meaningEditingController,
            hintText: 'Enter the meaning...',
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: MaterialButton(
          onPressed: () {
            if (_wordEditingController.text != '' &&
                _wordEditingController.text != ' ' &&
                _meaningEditingController.text != '' &&
                _meaningEditingController.text != ' ') {
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
                        child: Text(
                          "Cancel",
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
    );
  }
}
