import 'package:audiolizer/modules/common/widgets/error/retry_widget.dart';
import 'package:audiolizer/modules/common/widgets/list_tile_loader.dart';
import 'package:audiolizer/modules/home/home_feed/cubit/home_feed.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:audiolizer/modules/home/home_feed/services/webview_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:result_type/result_type.dart';
import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeFeedList extends StatefulWidget {
  const HomeFeedList({Key? key}) : super(key: key);

  @override
  State<HomeFeedList> createState() => _HomeFeedListState();
}

class _HomeFeedListState extends State<HomeFeedList> {
  PagingController<int, HomeFeedModel> pagingController = PagingController<int, HomeFeedModel>(firstPageKey: 0);
  final feedCubit = HomeFeedCubit();
  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener(onRequestPage);
  }

  void onRequestPage(int pageKey) async {
    await feedCubit.loadFeed();
  }

  @override
  void dispose() {
    feedCubit.close();
    pagingController.removePageRequestListener(onRequestPage);
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: feedCubit,
      child: Builder(builder: (context) {
        return BlocListener<HomeFeedCubit, Result<List<HomeFeedModel>, String>?>(
          listener: (context, state) {
            if (state != null) {
              state.result((feed) {
                pagingController
                  ..itemList = feed
                  ..nextPageKey = null;
              }, (error) {
                pagingController.error = error;
              });
            }
          },
          child: PagedSliverList(
            pagingController: pagingController,
            shrinkWrapFirstPageIndicators: true,
            builderDelegate: PagedChildBuilderDelegate<HomeFeedModel>(
              firstPageProgressIndicatorBuilder: (context) {
                return Column(
                  children: List.generate(2, (index) {
                    return InkWell(
                        onTap: () {
                          onRequestPage(0);
                        },
                        child: ListTileLoader());
                  }),
                );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return RetryWidget(
                  message: pagingController.error.toString(),
                );
              },
              itemBuilder: (context, item, index) {
                return HomeFeedTile(feed: item);
              },
            ),
          ),
        );
      }),
    );
  }
}

class HomeFeedTile extends StatelessWidget {
  final HomeFeedModel feed;
  const HomeFeedTile({
    Key? key,
    required this.feed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var placeholder = buildWidgetWithoutImage(context);
    return Card(
      margin: EdgeInsets.all(16),
      child: InkWell(
        onTap: (feed.url.trim().isNotEmpty)
            ? () {
                WebviewService.instance.open(url: Uri.parse(feed.url));
              }
            : null,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CachedNetworkImage(
            imageUrl: feed.avatar,
            errorWidget: (context, url, error) => placeholder,
            progressIndicatorBuilder: (context, url, progress) => placeholder,
            imageBuilder: (context, imageProvider) {
              return Row(
                children: [
                  Expanded(child: placeholder),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox.square(
                    dimension: 50,
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildWidgetWithoutImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          feed.title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 4,
        ),
        if (feed.description.trim().isNotEmpty)
          Text(
            feed.description,
            style: TextStyle(fontSize: 14),
          ),
        SizedBox(
          height: 4,
        ),
        if (feed.user.trim().isNotEmpty)
          Text(
            feed.user,
            style: TextStyle(fontSize: 10),
          ),
      ],
    );
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}
