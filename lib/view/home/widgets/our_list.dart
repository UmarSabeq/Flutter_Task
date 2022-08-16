import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task/data/model/movie_data.dart';
import 'package:task/view/details/details.dart';

class OurList extends StatefulWidget {
  const OurList({Key? key, required this.movie, required this.category})
      : super(key: key);
  final List<Movie> movie;
  final String category;

  @override
  State<OurList> createState() => _OurListState();
}

class _OurListState extends State<OurList> {
  List<Movie> action = [];
  @override
  void initState() {
    super.initState();
    var movieitem = widget.movie.where((e) {
      for (var x in e.genres) {
        if (x == widget.category) {
          return true;
        }
      }
      return false;
    });
    action.addAll(movieitem);
    print(action.length);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.category,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      movie: action[index],
                                    )));
                      }),
                      child: Image.network(
                        action[index].backdrop,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: action.length),
            ),
          )
        ],
      ),
    );
  }
}
