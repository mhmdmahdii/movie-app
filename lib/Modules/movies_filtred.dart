import 'package:flutter/material.dart';
import 'package:movies_app/Modules/filtred_item.dart';
import 'package:movies_app/models/category_movie.dart';
import 'package:movies_app/models/filtred_movies.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';

class MoviesFiltred extends StatelessWidget {
  static const String routeName = 'movies_flitred';

  @override
  Widget build(BuildContext context) {
    var sharched = ModalRoute.of(context)?.settings.arguments as Genres;
    Image addList = Image.asset('assets/images/addList.png',);
    return FutureBuilder<FiltredMovies>(
      future: ApiManager.getFiltered('${sharched.id}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Somithing went wrong'),
                    ),
                  );
                } else if (snapshot.data?.success == false) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Try again'),
                    ),
                  );
                }
                var listresult = snapshot.data?.results ?? [];
                return ListView.builder(
                  itemCount: listresult.length,
                  itemBuilder: (context, index) {
                    
                    return FiltredItem(result: listresult[index], 
                    name: sharched.name, addList: addList,);
                  },);
      },);
    
  }

  
}

