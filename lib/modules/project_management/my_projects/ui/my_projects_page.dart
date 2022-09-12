import 'package:audiolizer/modules/common/widgets/list_tile_loader.dart';
import 'package:audiolizer/modules/common/widgets/no_projects_widget.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_management/my_projects/cubits/selected_projects/selected_projects.dart';
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
        BlocProvider(
          create: (context) => SelectedProjectsCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<MyProjectsCubit, AllProjects?>(
          builder: (context, allProjects) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: BlocBuilder<SelectedProjectsCubit, SelectedProjects?>(
                  builder: (context, selectedProjects) {
                    if (selectedProjects != null) {
                      return WillPopScope(
                        onWillPop: () async {
                          BlocProvider.of<SelectedProjectsCubit>(context).endSelection();
                          return false;
                        },
                        child: AppBar(
                          leading: InkWell(
                            child: Icon(
                              Icons.cancel,
                            ),
                            onTap: () {
                              BlocProvider.of<SelectedProjectsCubit>(context).endSelection();
                            },
                          ),
                          title: Text(
                            '${selectedProjects.selectedProjects.length} selected',
                          ),
                          actions: [
                            PopupMenuButton(
                              child: Container(
                                child: Icon(Icons.more_vert),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(shape: BoxShape.circle),
                              ),
                              onSelected: (value) {
                                switch (value) {
                                  case 'select_all':
                                    BlocProvider.of<SelectedProjectsCubit>(context).selectAll(allProjects?.projects ?? []);
                                    break;
                                  case 'export_all':
                                    ShareProjectService.instance.shareProjects(selectedProjects.selectedProjects);
                                    break;
                                  default:
                                }
                              },
                              itemBuilder: (_) => [
                                if (selectedProjects.selectedProjects.isNotEmpty)
                                  PopupMenuItem(
                                    child: Text('Export Selected'),
                                    value: 'export_all',
                                  ),
                                PopupMenuItem(
                                  child: Text('Select All'),
                                  value: 'select_all',
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return AppBar(
                      title: Text('My Projects'),
                      actions: [
                        PopupMenuButton(
                          child: Container(
                                child: Icon(Icons.more_vert),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(shape: BoxShape.circle),
                              ),
                          onSelected: (value) {
                            switch (value) {
                              case 'select':
                                BlocProvider.of<SelectedProjectsCubit>(context).startSelection();
                                break;
                              default:
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text('Select'),
                              value: 'select',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              floatingActionButton: OpenProjectFAB(),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(),
                  ),
                  Builder(builder: (context) {
                    var pagingController = PagingController<int, Project>(firstPageKey: 0)
                      ..itemList = allProjects?.projects ?? []
                      ..nextPageKey = null;

                    return PagedSliverList(
                      pagingController: pagingController,
                      shrinkWrapFirstPageIndicators: true,
                      builderDelegate: PagedChildBuilderDelegate<Project>(
                        firstPageProgressIndicatorBuilder: (context) {
                          return Column(
                            children: List.generate(5, (index) {
                              return ListTileLoader();
                            }),
                          );
                        },
                        noItemsFoundIndicatorBuilder: (context) => NoProjectsWidget(),
                        itemBuilder: (context, project, index) {
                          return ProjectSelector(
                            project: project,
                            child: ProjectListTile(
                              key: ObjectKey(project),
                              project: project,
                              onLongPress: () {
                                BlocProvider.of<SelectedProjectsCubit>(context).startSelection();
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class ProjectSelector extends StatelessWidget {
  final Project project;
  final Widget child;
  const ProjectSelector({
    Key? key,
    required this.project,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedProjectsCubit, SelectedProjects?>(builder: (context, state) {
      if (state != null) {
        return Stack(
          children: [
            AbsorbPointer(absorbing: true, child: child),
            Positioned.fill(
              child: Container(
                color: state.selectedProjects.contains(project) ? Colors.red.withOpacity(.2) : null,
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<SelectedProjectsCubit>(context).selectProject(project);
                  },
                  child: SizedBox.square(
                    dimension: 2,
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return child;
    });
  }
}
