import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  loadcounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      counter = pref.getInt("counter") ?? 0;
    });
  }

  increment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      pref.setInt("counter", counter);
    });
  }

  @override
  void initState() {
    loadcounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have click $counter',
              style: TextStyle(fontSize: 20, color: Colors.purple),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
