import 'package:audiolizer/modules/common/widgets/list_tile_loader.dart';
import 'package:audiolizer/modules/common/widgets/no_projects_widget.dart';
import 'package:audiolizer/modules/home/home_feed/ui/home_feed_sliver_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:audiolizer/modules/common/widgets/project_list_tile.dart';
import 'package:audiolizer/modules/home/cubit/my_projects/my_projects.dart';
import 'package:audiolizer/modules/home/cubit/recently_opened/recently_opened.dart';
import 'package:audiolizer/modules/home/ui/open_project_fab.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/os_file_picker/platform_file_picker.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:audiolizer/modules/project_management/my_projects/ui/my_projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static String path = '/home';

  static Route<Project> route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => HomePage(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final GlobalKey<OpenProjectFABState> fabKey = GlobalKey<OpenProjectFABState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyProjectsCubit(),
        ),
        BlocProvider(
          create: (context) => RecentlyOpenedCubit(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          fabKey.currentState?.isFABClosed();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Audiolizer',
              style: TextStyle(
                fontFamily: 'Logo',
              ),
            ),
          ),
          floatingActionButton: OpenProjectFAB(
            key: fabKey,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  title: Text(
                    'My Projects',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: TextButton(
                      onPressed: () {
                        Navigator.push(context, MyProjectsPage.route());
                      },
                      child: Text('View All')),
                ),
              ),
              BlocBuilder<MyProjectsCubit, AllProjects?>(builder: (context, state) {
                var pagingController = PagingController<int, Project>(firstPageKey: 0)
                  ..itemList = (state != null)
                      ? state.projects.length > 2
                          ? state.projects.sublist(0, 2)
                          : state.projects
                      : null
                  ..nextPageKey = null;

                return PagedSliverList(
                  pagingController: pagingController,
                  shrinkWrapFirstPageIndicators: true,
                  builderDelegate: PagedChildBuilderDelegate<Project>(
                     firstPageProgressIndicatorBuilder: (context) {
          return Column(
            children: List.generate(3, (index) {
              return ListTileLoader();
            }),
          );
        },
                    noItemsFoundIndicatorBuilder: (context) {
                      return NoProjectsWidget();
                    },
                    itemBuilder: (context, project, index) {
                      return ProjectListTile(
                        key: ObjectKey(project),
                        project: project,
                      );
                    },
                  ),
                );
              }),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                  child: Divider(),
                ),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  title: Text(
                    'Feed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              HomeFeedList(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
