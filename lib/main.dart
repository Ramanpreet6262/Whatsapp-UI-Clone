import 'package:flutter/material.dart';

void main() => runApp(new myApp()); // big fat arrow => operator replaces this syntax

//void main() {runApp(new myApp());
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // to hide debug tag
      home: Whatsapp(),
    );
  }
}

class Whatsapp extends StatefulWidget {
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp>
    with SingleTickerProviderStateMixin {   // SingleTickerProviderStateMixin is for state animations..
  TabController whatsappcontroller;

  @override
  void initState() {
    whatsappcontroller = TabController(
        length: 4,
        vsync: this,
        initialIndex: 1); //vsync  for animation , this is for current context

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp'),
        backgroundColor: Color(0xff075E54), // ff opacity then rgb
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ), //onPressed: ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ), //onPressed: ),
        ],
        bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 2.7,
            controller: whatsappcontroller,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ]),
      ),
      body: TabBarView(controller: whatsappcontroller, children: [
        // HERE CHILDREN IS A LIST OF CHILDS SEPERATED BY COMMA
        Center(child: Text('CAMERA')),
        //Center(child: Text('CHATS')),
        ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Best Friend'),
                    subtitle: Text('kiven aaen bhai!!!!!!!!!!!'),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.wp.com%2Fwww.winhelponline.com%2Fblog%2Fwp-content%2Fuploads%2F2017%2F12%2Fuser.png%3Fresize%3D256%252C256%26quality%3D100&f=1'),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Yesterday'),
                        Text('8:56 PM'),
                      ],
                    ),

                    // return Padding(
                    // padding: const EdgeInsets.all(8.0),
                    //child: Container(    //this can return anything any container or anything  whatsapp uses Listtile.....
                    // width: 100.0,
                    //height: 100.0,
                    //color: Colors.blue,
                    //),
                  ),
                  Divider(
                      height: 1.0),
                ],
              );

            }),
        Center(child: Text('STATUS')),
        //Center(child: Text('CALLS')),
        ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Best Friend'),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.call_received,
                        color: Colors.red,
                        size: 15.0),
                        Text('9 August, 10:30 AM'),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.wp.com%2Fwww.winhelponline.com%2Fblog%2Fwp-content%2Fuploads%2F2017%2F12%2Fuser.png%3Fresize%3D256%252C256%26quality%3D100&f=1'),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                            Icons.call,
                        color: Colors.green),
                      ],
                    ), //onPressed: null),
                  ),
                  Divider( height: 1.0),
                ],
              );
            }),
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff25D366),
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
          onPressed: () {} ),
    );
  }
}
