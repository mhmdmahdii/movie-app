import 'package:flutter/material.dart';
import 'package:movies_app/Modules/movies_filtred.dart';
import 'package:movies_app/models/category_movie.dart';
import '../../Modules/category_item.dart';
import '../../shared/network/remote/api_manager.dart';

class BrowserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Browse Category',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: FutureBuilder<CategoryMovie>(
                future: ApiManager.getCategory(),
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

                  var listCategory = snapshot.data?.genres ?? [];

                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: listCategory.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: (() {
                            Navigator.pushNamed(context, MoviesFiltred.routeName,
                             arguments: listCategory[index]);
                          }),
                          child: CategoryItem(
                            genre: listCategory[index],
                          ),
                        );
                      }));
                }),
          ),
        ],
      ),
    );
  }
}
