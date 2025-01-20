import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Card',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          title: const Text(
            'Mi Card', 
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/thuonghoai.jpg"),
                radius: 80,
              ),
              Text(
                'Đặng Thị Thương Hoài',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  thickness: 1,
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+84 332 412 514',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'hoaidtt.22itb@vku.udn.vn',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
            ],
          )
        ),
      )
    );

  }
}