import 'package:flutter/material.dart';

class ReusebleDrawer extends StatelessWidget {
  const ReusebleDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Главная',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              tileColor: Colors.blue[100],
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
            SizedBox(
              height: 2,
            ),
            ListTile(
              title: Text(
                'Артисты',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              tileColor: Colors.blue[100],
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/artists', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
