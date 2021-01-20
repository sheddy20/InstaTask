import 'package:Opchoo/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController myTask = TextEditingController();
  List task = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("InstaTask"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.0),
            ),
            width: 350.0,
            padding: EdgeInsets.all(20.0),
            child: TextField(
              onSubmitted: (text) {
                task.add(text);
                myTask.clear();
                setState(() {});
              },
              controller: myTask,
              decoration: InputDecoration(
                hintText: "Your Task For Today",
                prefixIcon: Icon(FontAwesomeIcons.tasks),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemCount: task.length,
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.grey[600],
                  child: ListTile(
                    title: Text(
                      task[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(Icons.arrow_right),
                    trailing: Icon(Icons.delete, color: Colors.white),
                    onTap: () {
                      setState(() {
                        task.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<AuthenticateProvider>().signOut();
        },
        icon: Icon(Icons.person),
        backgroundColor: Colors.teal,
        label: Text("SignOut"),
      ),
    );
  }
}
