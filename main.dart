import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataPage(),
    );
  }
}

class DataPage extends StatefulWidget {
  DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  String data = "";
  int flag = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data,
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () async {
                if (flag == 1) {
                  final String f = await getData();
                  setState(() {
                    flag = 0;
                    data = f;
                  });
                }
              },
              child: Text(
                "Press Here",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final String f = await getData1();
                setState(() {
                  data = f;
                });
              },
              child: Text(
                "Retry",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> getData() async {
  final url = Uri.parse("your port/getdata");
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final s = data["message"];
      return s;
    } else {
      print("Invalid");
    }
  } catch (e) {
    print("error");
  }
  return "0";
}

Future<String> getData1() async {
  final url = Uri.parse("Your port/getdata");
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final s = data["message"];
      return s;
    } else {
      print("Invalid");
    }
  } catch (e) {
    print("error");
  }
  return "0";
}
