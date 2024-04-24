import 'package:flutter/material.dart';

class Listview1 extends StatelessWidget {
  var thindivider = Divider(
    thickness: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("listviewpage"),
        actions: [
          Icon(Icons.camera_alt),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          PopupMenuButton(
              itemBuilder: (context) =>
                  [const PopupMenuItem(child: Text('new group')),
                  const PopupMenuItem(child: Text('new brodcast')),
                  const PopupMenuItem(child: Text('linked devices')),
                  const PopupMenuItem(child: Text('settings'))]),
          Padding(padding: EdgeInsets.only(right: 8))
        ],
        elevation: 5,
      ),
      body: ListView(
        children: [
          //  Image.asset("assets/images/image2.png"),
          //  thindivider,
          //    Image.asset("assets/images/image2.png"),
          //   thindivider,
          //     Image.asset("assets/images/image2.png"),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/image2.png"),
              backgroundColor: Colors.black,
            ),
            title: Text(
              "Sreerag",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            subtitle: Text("9037402492"),
            trailing: Icon(
              Icons.phone,
              color: Colors.blue,
            ),
          ),
          // thindivider,
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/images/image2.png"),
            ),
            title: Text(
              "Sreerag",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                Text(
                  "hii",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            trailing: Column(
              children: [
                CircleAvatar(
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 10),
                  ),
                  backgroundColor: Color.fromARGB(255, 3, 245, 43),
                  radius: 12,
                ),
                SizedBox(height: 10),
                Text("yesterday")
              ],
            ),
          ),
          // thindivider,
          Card(
            elevation: 10,
            shadowColor: Colors.blue,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage("assets/images/splash_screen.jpg"),
                radius: 25,
              ),
              title: Text(
                "Sreerag",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              subtitle: Text("9037402492"),
              trailing: Wrap(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(Icons.message)
                ],
              ),
            ),
          ),
          //   thindivider,
          Card(
            elevation: 10,
            shadowColor: Colors.blue,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage("assets/images/image2.png"),
              ),
              title: Text(
                "Sreerag",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              subtitle: Text("9037402492"),
              trailing: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
          ),
          // thindivider,
          Card(
            elevation: 10,
            shadowColor: Colors.blue,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage("assets/images/image2.png"),
              ),
              title: Text(
                "Sreerag",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              subtitle: Text("9037402492"),
              trailing: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
          ),
          //  thindivider,
        ],
      ),
    );
  }
}
