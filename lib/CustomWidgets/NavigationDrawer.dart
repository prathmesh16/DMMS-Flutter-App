import 'package:flutter/material.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(49, 139, 176, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 8),
                Image(
                  image: AssetImage('assets/logo.webp'),
                  height: 80,
                  width: 80,
                ),
                SizedBox(height: 8),
                Text(
                    'DMMS Nursing Academy',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'nunito_bold',
                      fontSize: 18
                    ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
