import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  // final String name;
  final String image;
  final String temperature;
  final String ph;
  final String humidity;
  final String nitrogen;
  final String waterlevel;
  final String naming;
  final Map keys;

  DetailScreen({
    // required this.name,
    required this.image,
    required this.temperature,
    required this.ph,
    required this.humidity,
    required this.nitrogen,
    required this.waterlevel,
    required this.keys,
    required this.naming,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 33, 150, 70)),
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Center(
                child: Text(
                  "CROP 2X",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  border: Border.all(width: 0.5, color: Colors.brown)),
              child: ClipOval(
                  child: Image.asset(
                (widget.image),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "نام: ${widget.naming}",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 0),
                      child: Text(
                        "${widget.temperature} : درجہ حرارت",
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Text("${widget.ph} : پی ایچ رینج",
                          style: TextStyle(fontSize: 20))),
                  Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Text(" ${widget.humidity} : نمی کی حد ",
                          style: TextStyle(fontSize: 20))),
                  Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text("  نائٹروجن رینج : ${widget.nitrogen} ",
                          style: TextStyle(fontSize: 20))),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                          " ${widget.waterlevel} : پانی کی سطح فی دن لیٹر میں ",
                          style: TextStyle(fontSize: 20))),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () async {
                  FirebaseDatabase.instance
                      .ref("crop")
                      .child(widget.keys['name'])
                      .remove();
                  Navigator.pop(context);
                },
                child: Text(
                  "Delete / حذف کریں۔",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        width: 0.1,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Back /پیچھے",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
      
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        width: 0.1,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
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
