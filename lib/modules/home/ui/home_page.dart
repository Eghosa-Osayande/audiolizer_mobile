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
            title: Text('Audiolizer'),
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
                  // trailing: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(context, MyProjectsPage.route());
                  //     },
                  //     child: Text('View All')),
                ),
              ),
              BlocBuilder<MyProjectsCubit, List<Project>?>(builder: (context, state) {
                var pagingController = PagingController<int, Project>(firstPageKey: 0)
                  ..itemList = state
                  ..nextPageKey = null;

                return PagedSliverList(
                  pagingController: pagingController,
                  shrinkWrapFirstPageIndicators: true,
                  builderDelegate: PagedChildBuilderDelegate<Project>(
                    noItemsFoundIndicatorBuilder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "You have no projects yet",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(CreateProjectPage.route());
                                },
                                child: Text('New Project'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  var path = await PlatformFilePickerService.instance.pickFile();
                                  if (path != null) {
                                    ShareProjectService.instance.processFileFromPath(path);
                                  }
                                },
                                child: Text('Open File'),
                              ),
                            ],
                          )
                        ],
                      );
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
                child: SizedBox(height: 200),
              )
            ],
          ),
        ),
      ),
    );
  }
}
