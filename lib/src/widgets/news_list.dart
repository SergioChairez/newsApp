import 'package:flutter/material.dart';
import 'package:flutter_projects/src/theme/theme.dart';

import '../models/news_models.dart';

class NewsList extends StatelessWidget {

  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
        return _New(story: news[index], index: index);
        }
    );
  }
}

class _New extends StatelessWidget {
  final Article story;
  final int index;

  const _New({required this.story, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard(story, index),

        _TitleCard( story ),
        
        _ImageCard( story ),
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {

  final Article story;
  final int index;

  const _TopBarCard(this.story, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      margin:  const EdgeInsets.only( bottom: 10 ),
      child: Row(
        children: [
          Text('${ index + 1 }.',
            style: TextStyle( color: myTheme.colorScheme.background ),),
          Text(story.source.name.name ),
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {

  final Article story;

  const _TitleCard(this.story);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: Text( story.title,
        style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700 ), ),
    );
  }
}

class _ImageCard extends StatelessWidget {

  final Article story;

  const _ImageCard(this.story);

  @override
  Widget build(BuildContext context) {
    print('story.urlToImage: ${story.urlToImage}');
    return Container(
      child: FadeInImage(
        placeholder: const AssetImage('assets/img/giphy.gif'),
        image: NetworkImage( '${story.urlToImage}' ),
      ),
    );
  }
}




