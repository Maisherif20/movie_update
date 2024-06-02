import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/presentation_layer/ui/homeScreen/homeScreenViewModel.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/homeTab.dart';
import 'package:untitled/presentation_layer/ui/tabs/searchTab/searchTab.dart';
import 'package:untitled/presentation_layer/ui/tabs/watchListTab/watchListTab.dart';

import '../tabs/browseTab/browseTab.dart';
class HomeScreen extends StatefulWidget {
  static const routeName  = "Home Screen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViemModel = getIt<HomeScreenViewModel>();
  int selectedIndex = 0;
  Widget tabPreview = HomeTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
        bloc: homeScreenViemModel,
        builder: (BuildContext context, state) {
          if (state is HomeTabState) {
            tabPreview = HomeTab();
          } else if (state is SearchTabState) {
            tabPreview = SearchTab();
          } else if (state is BrowseTabState) {
            tabPreview = BrowseTabView();
          } else if (state is WatchListTabState) {
            tabPreview = WatchListTab();
          }
          return Scaffold(
            backgroundColor:  Color.fromRGBO(18, 18, 18, 1),
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: const Text(
                "Movies",
                style: TextStyle(
                    color: Color.fromRGBO(255, 187, 59, 1), fontSize: 30),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                      onTap: () {
                      },
                      child: const Row(
                        children: [
                          Text("Log out" , style: TextStyle(color: Color.fromRGBO(255, 187, 59, 1)),),
                          SizedBox(width: 5,),
                          Icon(
                            Icons.logout,
                            color: Color.fromRGBO(255, 187, 59, 1),
                            size: 25,
                          ),
                        ],
                      )),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: const Color.fromRGBO(255, 187, 59, 1),
              unselectedItemColor: Colors.white,
              onTap: (index) {
                selectedIndex = index;
                homeScreenViemModel.getTabs(selectedIndex);
              },
              currentIndex: selectedIndex,
              backgroundColor: const Color.fromRGBO(0, 65, 130, 1),
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(26, 26, 26, 1),
                    icon: selectedIndex == 0
                        ? const ImageIcon(
                          AssetImage("assests/images/img.png" ),
                        )
                        : const ImageIcon(
                      AssetImage("assests/images/img.png"),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(26, 26, 26, 1),
                    icon: selectedIndex == 1
                        ? const ImageIcon(
                          AssetImage("assests/images/img_1.png"),
                        )
                        : const ImageIcon(
                      AssetImage("assests/images/img_1.png"),
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(26, 26, 26, 1),
                    icon: selectedIndex == 2
                        ? const ImageIcon(
                            AssetImage("assests/images/img_2.png"),)
                        : const ImageIcon(AssetImage("assests/images/img_2.png"),),
                    label: "Browse"),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(26, 26, 26, 1),
                    icon: selectedIndex == 3
                        ? const ImageIcon(
                          AssetImage(
                            "assests/images/img_3.png",
                          ),
                        )
                        : const ImageIcon(
                      AssetImage(
                        "assests/images/img_3.png",
                      ),
                    ),
                    label: "Watchlist"),
              ],
            ),
            body: tabPreview,
          );
        });
  }
}
