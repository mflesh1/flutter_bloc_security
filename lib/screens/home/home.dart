import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_security/bloc/authentication/barrel.dart';
import 'package:flutter_bloc_security/components/buttons/primary_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("Joe Smity"),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new Text("Item 1"),
            new Text("Item 2"),
            new Text("Item 3"),
            new Text("Item 4"),
            new Text("Item 5"),
            new Text("Item 6"),
          ],
        ),
      ),
      body: Center(
        child: PrimaryButton(
          label: "Logout",
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(new LoggingOutEvent());
          },
        )
      ),
    );
  }
}
