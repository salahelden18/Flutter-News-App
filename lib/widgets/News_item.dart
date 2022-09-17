import 'package:flutter/material.dart';
import 'package:news_app_2/screens/web_view.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(this.snapshot, this.index, {Key? key}) : super(key: key);

  final AsyncSnapshot<List<dynamic>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(WebViewWidget.routeName,
            arguments: snapshot.data?[index]['url']);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            snapshot.data?[index]['urlToImage'] ??
                'https://images.unsplash.com/photo-1462206092226-f46025ffe607?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJ1c2luZXNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Text(
            snapshot.data?[index]['title'] ?? 'unknown',
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            snapshot.data?[index]['description'] ?? 'unknown',
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
