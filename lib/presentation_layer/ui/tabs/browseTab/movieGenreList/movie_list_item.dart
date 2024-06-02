import 'package:flutter/material.dart';
import 'package:untitled/constants/Constant.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key,required this.title,
    required this.image,
    required this.releaseDate,
    // required this.overView
  });
  final String title;
   final String image;
   // final String overView;
   final String releaseDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.network(
                  "${Constant.imagePath}$image",
                  width: 140,
                  height: 120,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5,),
                      Text(releaseDate, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
