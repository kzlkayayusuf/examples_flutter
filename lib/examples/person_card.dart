import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 88,
              backgroundImage: AssetImage('assets/images/yusuf.png'),
            ),
            Text(
              'Yusuf KIZILKAYA',
              style: TextStyle(
                fontFamily: 'RubikPuddles',
                fontSize: 28.0,
                color: Colors.teal.shade50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+77 777 777 777',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'yusuf@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiceApp(),
                  ),
                );
              },
              child: Text(
                'Go to Next Page',
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}