import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.dribbble.com/users/11125/screenshots/11342016/bruh_4x.png"),
                )),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: GestureDetector(
                  child: Text("CH"), onTap: () => Navigator.pop(context)),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image(
          image: AssetImage("assets/bruh_4x.png"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_time_filled),
          onPressed: () => Navigator.pop(context)),
    );
  }
}
