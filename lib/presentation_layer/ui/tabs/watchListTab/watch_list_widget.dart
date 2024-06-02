import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/generated/assets.dart';
import 'package:untitled/presentation_layer/ui/tabs/watchListTab/watchListViewModels/deleteMovieViewModel.dart';

import '../../../../constants/Constant.dart';

class WatchListWidget extends StatefulWidget {
  final String title;
  final String id;
  final String image;
  final String releaseDate;
  const WatchListWidget({
    super.key,
    required this.title,
    required this.id,
    required this.image,
    required this.releaseDate,
  });

  @override
  State<WatchListWidget> createState() => _WatchListWidgetState();
}

class _WatchListWidgetState extends State<WatchListWidget> {
  DeleteMovieViewModel deleteMovieViewModel = getIt<DeleteMovieViewModel>();
  @override
  // void didUpdateWidget(covariant WatchListWidget oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  // }
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>deleteMovieViewModel,
      child: Container(
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "${Constant.imagePath}${widget.image}",
                        width: 150,
                        height: 120,
                      ),
                      Positioned(
                        left: 15,
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.imagesImg5,
                              height: 36,
                              width: 28,
                            ),
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style:
                              const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(widget.releaseDate,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17)),
                      ],
                    ),
                  ),
                  BlocConsumer(
                    bloc: deleteMovieViewModel,
                    builder: (BuildContext context, state) {
                      if (state is WatchListLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          ),
                        );
                      }
                      return InkWell(
                          onTap: () {
                            // Movie movie = Movie();
                            // MovieDao.deleteMovie(id);
                            deleteMovieViewModel.deleteFromWatchList(movieId: widget.id);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.delete,
                              color: Color.fromRGBO(255, 187, 59, 1),
                              size: 30,
                            ),
                          ));
                    },
                    listener: (BuildContext context, Object? state) {
                      if (state is WatchListErrorState) {
                        Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20.0);
                      }
                      if (state is WatchListSuccessState) {
                        Fluttertoast.showToast(
                            msg:"Deleted From watchList",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 20.0);
                      }
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.white,
                height: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:untitled/DI/dI.dart';
// import 'package:untitled/generated/assets.dart';
// import 'package:untitled/presentation_layer/ui/tabs/watchListTab/watchListViewModels/deleteMovieViewModel.dart';
//
// import '../../../../constants/Constant.dart';
//
// class WatchListWidget extends StatefulWidget {
//   final String title;
//   final String id;
//   final String image;
//   final String releaseDate;
//   const WatchListWidget({
//     super.key,
//     required this.title,
//     required this.id,
//     required this.image,
//     required this.releaseDate,
//   });
//
//
//   @override
//   State<WatchListWidget> createState() => _WatchListWidgetState();
// }
//
// class _WatchListWidgetState extends State<WatchListWidget> {
//
//   @override
//
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Colors.black,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 10, bottom: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               children: [
//                 Stack(
//                   children: [
//                     Image.network(
//                       "${Constant.imagePath}${widget.image}",
//                       width: 150,
//                       height: 120,
//                     ),
//                     Positioned(
//                       left: 15,
//                       child: Stack(
//                         children: [
//                           Image.asset(
//                             Assets.imagesImg5,
//                             height: 36,
//                             width: 28,
//                           ),
//                           const Icon(
//                             Icons.check,
//                             color: Colors.white,
//                             size: 25,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.title,
//                         style:
//                         const TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text(widget.releaseDate,
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 17)),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                     onTap: () async{
//                       // Movie movie = Movie();
//                       // MovieDao.deleteMovie(id);
//                       DeleteMovieViewModel deleteMovieViewModel = getIt<DeleteMovieViewModel>();
//                       await deleteMovieViewModel.deleteFromWatchList(movieId: widget.id);
//                       setState(() {});
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.only(right: 20),
//                       child: Icon(
//                         Icons.delete,
//                         color: Color.fromRGBO(255, 187, 59, 1),
//                         size: 30,
//                       ),
//                     ))
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Divider(
//               color: Colors.white,
//               height: 2,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

