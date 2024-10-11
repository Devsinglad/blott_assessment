import 'package:blott_assessment/helpers/assets/color.dart';
import 'package:blott_assessment/helpers/constants.dart';
import 'package:blott_assessment/helpers/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/model/news_model.dart';
import '../../view-model/home-view-model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String firstName = "John";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) async {
        var homeProvider =
            Provider.of<HomeNewsViewModel>(context, listen: false);
        await homeProvider.getNews(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundContainer(),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Consumer<HomeNewsViewModel>(
                  builder: (context, homeProvider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey ${Repository.getInstance()!.getName()}",
                      style: AppConstants.myStyle.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    homeProvider.newsList.isEmpty
                        ? Text(
                            'Something went wrong. Please try again later.',
                            style: AppConstants.myStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )
                        : Expanded(
                            child:
                                NewsListView(newsItems: homeProvider.newsList),
                          ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slide(begin: const Offset(0, 1.0))
        .animate()
        .fadeIn(duration: 600.ms)
        .slide(begin: const Offset(.1, 0.0))
        .animate()
        .fadeIn(duration: 900.ms)
        .slideY(begin: .1, end: .0);
  }
}

class NewsListView extends StatefulWidget {
  const NewsListView({
    super.key,
    required this.newsItems,
  });

  final List<NewsModel> newsItems;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMore) {
      setState(() {
        _isLoadingMore = true;
      });

      var homeProvider = Provider.of<HomeNewsViewModel>(context, listen: false);
      await homeProvider.getNews(context, loadMore: true);

      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeNewsViewModel>(context, listen: false);

    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.newsItems.length + (_isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == widget.newsItems.length) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final news = widget.newsItems[index];
        return GestureDetector(
          onTap: () {
            homeProvider.launchURL(context, news.url.toString());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  width: 100.w,
                  height: 100.h,
                  child: Image.network(
                    news.image.toString(),
                    errorBuilder: (context, error, stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 20.0,
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            'Error loading image',
                            style: AppConstants.myStyle
                                .copyWith(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        // Image has finished loading
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 80.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              news.source!.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              news.getFormattedDate(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          news.headline!.toUpperCase().toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.maxFinite,
          color: primaryColor,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.maxFinite,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
