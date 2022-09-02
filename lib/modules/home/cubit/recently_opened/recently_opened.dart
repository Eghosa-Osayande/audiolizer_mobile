import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/project/project_model.dart';

class RecentlyOpenedCubit extends Cubit<List<Project>?> {
  RecentlyOpenedCubit() : super(null);
}