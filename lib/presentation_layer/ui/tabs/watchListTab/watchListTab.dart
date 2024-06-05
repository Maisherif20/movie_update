import 'package:flutter/material.dart';

import 'package:untitled/presentation_layer/ui/tabs/watchListTab/watchListView.dart';

class WatchListTab extends StatelessWidget {
  static String routeName = "WatchList";

   const WatchListTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Padding(
          //   padding: EdgeInsets.only(left: 15),
          //   child: Text(
          //     'Watch List',
          //     style: TextStyle(
          //         fontSize: 30,
          //         fontWeight: FontWeight.w400,
          //         color: Colors.white),
          //   ),
          // ),
          Expanded(child: WatchListView()),
        ],
      ),
    );
  }
}
