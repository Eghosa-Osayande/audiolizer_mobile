import 'package:audiolizer/modules/common/widgets/no_projects_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:audiolizer/modules/common/widgets/project_list_tile.dart';
import 'package:audiolizer/modules/home/cubit/my_projects/my_projects.dart';
import 'package:audiolizer/modules/home/cubit/recently_opened/recently_opened.dart';
import 'package:audiolizer/modules/home/ui/open_project_fab.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';

class MyProjectsPage extends StatefulWidget {
  const MyProjectsPage({
    Key? key,
  }) : super(key: key);

  static String path = '/myProjects';

  static Route<Project> route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => MyProjectsPage(),
    );
  }

  @override
  State<MyProjectsPage> createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends State<MyProjectsPage> with SingleTickerProviderStateMixin {
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
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Projects'),
        ),
        floatingActionButton: OpenProjectFAB(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(),
            ),
            BlocBuilder<MyProjectsCubit, List<Project>?>(builder: (context, state) {
              var pagingController = PagingController<int, Project>(firstPageKey: 0)
                ..itemList = state
                ..nextPageKey = null;

              return PagedSliverList(
                pagingController: pagingController,
                shrinkWrapFirstPageIndicators: true,
                builderDelegate: PagedChildBuilderDelegate<Project>(
                  noItemsFoundIndicatorBuilder: (context) => NoProjectsWidget(),
                  itemBuilder: (context, project, index) {
                    return ProjectListTile(
                      key: ObjectKey(project),
                      project: project,
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
