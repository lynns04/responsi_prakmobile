import 'package:flutter/material.dart';
import 'package:responsi_mobile/model/category_models.dart';
import 'package:responsi_mobile/model/meals_models.dart';
import 'package:responsi_mobile/model/detailmeal_model.dart';
import 'package:responsi_mobile/page/detail_page.dart';
import 'package:responsi_mobile/service/api_data_source.dart';

class ListPage extends StatefulWidget {
  final String title;

  const ListPage({super.key, required this.title});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    var endpoint = widget.title == 'categories' ? 'categories' : widget.title;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.title.toUpperCase()} MEALS'),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadList(endpoint),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (widget.title == 'categories') {
              CategoryModels category = CategoryModels.fromJson(snapshot.data!);
              return _buildNews(category);
            } else if (widget.title == 'filter') {
              MealsModels meals = MealsModels.fromJson(snapshot.data!);
              return _buildBlogs(meals);
            } else {
              DetailMealsModels detail = DetailMealsModels.fromJson(snapshot.data!);
              return _buildReports(detail);
            }
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Gimana yh ga keambil API nya'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildNews(CategoryModels category) {
    return ListView.builder(
      itemCount: category.categories!.length,
      itemBuilder: (context, index) {
        var item = category.categories![index];
        return _buildItemList(
          item.idCategory!,
          item.strCategory!,
          item.strCategoryThumb!,
        );
      },
    );
  }

  Widget _buildBlogs(MealsModels meals) {
    return ListView.builder(
      itemCount: meals.meals!.length,
      itemBuilder: (context, index) {
        var item = meals.meals![index];
        return _buildItemList(
          item.strMeal!,
          item.strMealThumb!,
          item.idMeal!,
        );
      },
    );
  }

  Widget _buildReports(DetailMealsModels detail) {
    return ListView.builder(
      itemCount: detail.meals!.length,
      itemBuilder: (context, index) {
        var item = detail.meals![index];
        return _buildItemList(
          item.idMeal!,
          item.strCategory!,
          item.strInstructions!,
        );
      },
    );
  }

  Widget _buildItemList(
      String name, String categories, String youtubeUrl) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              id: widget.title,
              name: name,
              categories: categories,
              youtubeUrl: youtubeUrl,
            ),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network(
              //   img,
              //   width: 150,
              //   height: 100,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
