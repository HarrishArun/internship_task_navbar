import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  // Set your desired color here

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // Set your desired color here
      ),
    );
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int notificationcount = 0;
  int favouritecount = 0;
  int cartcount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Nav Bar',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 0),
        screens: buildscreens(),
        items: navbaritems(),
        backgroundColor: Color(171717),
        stateManagement: true,
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }

  List<Widget> buildscreens() {
    return [
      Notificationscreen(
          count: notificationcount,
          onIncrease: () {
            setState(() {
              notificationcount++;
            });
          },
          onDecrease: () {
            setState(() {
              if (notificationcount > 0) {
                notificationcount--;
              }
            });
          }),
      cartscreen(
          count: cartcount,
          onIncrease: () {
            setState(() {
              cartcount++;
            });
          },
          onDecrease: () {
            setState(() {
              if (cartcount > 0) {
                cartcount--;
              }
            });
          }),
      favouritescreen(
          count: favouritecount,
          onIncrease: () {
            setState(() {
              favouritecount++;
            });
          },
          onDecrease: () {
            setState(() {
              if (favouritecount > 0) {
                favouritecount--;
              }
            });
          }),
    ];
  }

  List<PersistentBottomNavBarItem> navbaritems() {
    return [
      PersistentBottomNavBarItem(
          icon: Stack(
            children: [
              Icon(Icons.notifications),
              if (notificationcount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    constraints: BoxConstraints(minHeight: 16, minWidth: 16),
                    child: Text(
                      '$notificationcount',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          ),
          title: "Notificaions",
          activeColorPrimary: Colors.lightBlue,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Stack(
            children: [
              Icon(Icons.shopping_cart),
              if (cartcount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    constraints: BoxConstraints(minHeight: 16, minWidth: 16),
                    child: Text(
                      '$cartcount',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          ),
          title: "Cart",
          activeColorPrimary: Colors.lightBlue,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Stack(
            children: [
              Icon(Icons.favorite),
              if (favouritecount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    constraints: BoxConstraints(minHeight: 16, minWidth: 16),
                    child: Text(
                      '$favouritecount',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          ),
          title: "Favourites",
          activeColorPrimary: Colors.lightBlue,
          inactiveColorPrimary: Colors.grey),
    ];
  }
}

class Notificationscreen extends StatelessWidget {
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  Notificationscreen({
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count:$count',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onIncrease,
                child: Icon(Icons.add),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: onDecrease,
                child: Icon(Icons.remove),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      )),
    );
  }
}

class favouritescreen extends StatelessWidget {
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  favouritescreen({
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count:$count',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onIncrease,
                child: Icon(Icons.add),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: onDecrease,
                child: Icon(Icons.remove),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      )),
    );
  }
}

class cartscreen extends StatelessWidget {
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  cartscreen({
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count:$count',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onIncrease,
                child: Icon(Icons.add),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: onDecrease,
                child: Icon(Icons.remove),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      )),
    );
  }
}
