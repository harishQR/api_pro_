import 'dart:convert';
import 'package:api_pro/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          flexibleSpace:Container(
            height: 600,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
            ),

          ),
        title: Text("User Data",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          Container(
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width : MediaQuery.of(context).size.width,
                  height: 800,
                  child: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
                    final user = users[index];
                    final name = user['name']['first'];
                    final email = user['email'];
                    final img = user['picture']['thumbnail'];
                    return ListTile(
                      leading: CircleAvatar(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(img)),
                      ),
                      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(email),
                    );
                  }),
                )
              ],
            ),
        ),
          Positioned(
            bottom: 5,
            right: 5,
            child:
            FloatingActionButton(onPressed: fetchuser,child: Icon(Icons.add,),backgroundColor: Colors.lightGreen ,),
          ),
          ],
      ),
    );
  }
  void fetchuser() async{
    print("data fetched...");
   const url = "https://randomuser.me/api/?results=25";
    final uri = Uri.parse(url);
  final res = await http.get(uri);
  final body = res.body;
  final json = jsonDecode(body);
   setState(() {
        users = json['results'];
   });
  }
}
