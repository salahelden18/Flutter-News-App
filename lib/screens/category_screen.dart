import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/news_provider.dart';
import '../widgets/News_item.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category-screen';
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;
    final formattedName = name.toLowerCase();
    print(formattedName);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // body: Colu,
      body: FutureBuilder(
        future: Provider.of<NewsProvider>(context, listen: false)
            .getArticles(formattedName),
        builder: (ctx, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 10,
                itemBuilder: (ctx, index) => NewsItem(snapshot, index),
              ),
            );
          }
        },
      ),
    );
  }
}
