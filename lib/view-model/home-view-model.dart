import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/model/news_model.dart';
import '../data/service-api/blott-service.dart';
import '../data/service-api/errorHandling.dart';
import '../helpers/custom_widgets/loading_widget.dart';

class HomeNewsViewModel extends ChangeNotifier {
  final BlottApi newsRepository = BlottApi();
  List<NewsModel> newsList = [];

  Future<void> getNews(BuildContext context, {bool loadMore = false}) async {
    if (!loadMore) {
      Load.show(context);
    }
    try {
      var fetchedNews = await newsRepository.fetchNews();
      if (loadMore) {
        newsList.addAll(fetchedNews);
      } else {
        newsList = fetchedNews;
      }
      notifyListeners();
    } catch (e, s) {
      handleDioError(e, context);
    } finally {
      if (!loadMore) {
        Load.dismiss(context);
      }
    }
  }

  void launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      customPopUp(context, 'Could not launch $url', 'warning');
    }
  }
}
