import 'package:audiolizer/modules/os_permission/services/permission/platform_permission_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class OsPermissionBuilder extends StatelessWidget {
  final WidgetBuilder hasPermissionBuilder;
  final WidgetBuilder loadingBuilder;
  final Widget Function(
    BuildContext context,
    Future<void> Function() requestPermission,
  ) noPermissionBuilder;
  final Permission permission;
  const OsPermissionBuilder({
    Key? key,
    required this.hasPermissionBuilder,
    required this.noPermissionBuilder,
    required this.permission,
    required this.loadingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: PlatformPermissionService.instance.permissionRequestedStream,
      builder: (context, _) {
        late Stream<bool> checkPermissionStream = PlatformPermissionService.instance.checkPermissionStream(permission);
        return StreamBuilder(
          key: UniqueKey(),
          stream: checkPermissionStream,
          builder: (context, snapshot) {
            print([
              9999,
              snapshot.data
            ]);
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return hasPermissionBuilder(context);
              } else {
                return noPermissionBuilder(
                  context,
                  () async => await PlatformPermissionService.instance.request(permission),
                );
              }
            }
            return loadingBuilder(context) ;
          },
        );
      },
    );
  }
}
