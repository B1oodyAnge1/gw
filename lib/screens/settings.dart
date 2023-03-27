import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Settings> {
  late String str;
  bool isSwitched = false;
  @override
  Widget build(BuildContext contex) {
    //double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: isSwitched ? Colors.black : Colors.white,
      body: NestedScrollView(
        // Движущийся appbar
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              title: const Text("MyVideo"),
              floating: true,
              expandedHeight: 50.0,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.only(
            left: 0,
            top: 20,
          ),
          children: <Widget>[
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const <Widget>[
                      Text(
                        "Темная тема",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.blue,
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        //Боковое меню
        child: ListView(
          children: <Widget>[
            const SizedBox(
              // Заголовок и его background
              height: 64,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  "Меню",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: const Text("Настрйоки"),
              onTap: () => Navigator.pushNamed(context, '/0'),
            )
          ],
        ),
      ),
    );
  }

  void onTapSetings() {}
}
