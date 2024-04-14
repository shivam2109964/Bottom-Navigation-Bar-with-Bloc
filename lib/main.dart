import 'package:bottom_navigation/bloc/BottomNavi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BottomNaviBloc(),
        child: const MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  Widget build(BuildContext context) {
    final BottomNaviBloc _naviBloc = BlocProvider.of<BottomNaviBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
      ),
      body: BlocBuilder<BottomNaviBloc, int>(
        builder: (context, currentIndex) {
          switch (currentIndex) {
            case 0:
              return const Center(
                child: Text("Home"),
              );
            case 1:
              return const Center(
                child: Text("Profile"),
              );
            case 2:
              return const Center(
                child: Text("Settings"),
              );
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNaviBloc, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              _naviBloc.add(BottomNavigationEvent.values[index]);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
          );
        },
      ),
    );
  }
}
