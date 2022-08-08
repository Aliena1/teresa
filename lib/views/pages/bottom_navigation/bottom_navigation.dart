import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/views/pages/active_job/active_job.dart';
import 'package:teresa/views/pages/available_job/available_job.dart';
import 'package:teresa/views/pages/home/home.dart';
import 'package:teresa/views/pages/profile/profile.dart';
import 'package:teresa/views/pages/schedule/schedule.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


class TeresaBottomNavigation extends StatefulWidget {
  const TeresaBottomNavigation({Key? key}) : super(key: key);

  @override
  State<TeresaBottomNavigation> createState() => _TeresaBottomNavigationState();
}

class _TeresaBottomNavigationState extends State<TeresaBottomNavigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    ActiveJob(),
    AvailableJob(),
    Schedule(),
    Profile(),
  ];


  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Future<bool?> showWarning(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('You are going to exit the application!!'),
            actions: <Widget>[
              TextButton(
                child: const Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text('YES'),
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: () async{
              final shouldPop=await showWarning(context);
              return shouldPop?? false;
            },
          child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: const Color(AppColors.WHITE),
            backgroundColor: const Color(AppColors.STRONG_BLUE),
            selectedLabelStyle:
            TextStyle(fontSize: Dimensions.height11, fontFamily: "Helvetica"),
            iconSize: Dimensions.height22,
            unselectedLabelStyle:
            TextStyle(fontSize: Dimensions.height11, fontFamily: "Helvetica"),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: 'Active Job',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Available job',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(AppColors.STRONG_CYAN),
            onTap: _onItemTapped,
          ),
        )));
  }
}
