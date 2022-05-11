import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void onFabTap() {
      const snackBar = SnackBar(
        content: Text('FAB was tapped'),
        /*action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),*/
      );
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Flutter Base',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFabTap,
        tooltip: 'TODO',
        child: const Icon(Icons.add),
      ),
    );
  }
}
