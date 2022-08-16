import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/movie_cubit.dart';
import 'package:task/injection_container.dart';
import 'package:task/view/home/widgets/our_appbar.dart';
import 'package:task/view/home/widgets/our_list.dart';
import 'package:task/view/home/widgets/search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar(),
      body: BlocProvider(
        create: (context) => getIt<MovieCubit>()..getMovies(),
        child: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MovieLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Action",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Crime",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Drama",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Biography",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Thriller",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Mystery",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "History",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Animation",
                        )),
                    SizedBox(
                        height: 200,
                        child: OurList(
                          movie: state.moviesDataListModel.movies,
                          category: "Sci-Fi",
                        )),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
