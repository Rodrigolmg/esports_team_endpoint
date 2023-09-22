library datasource;

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:esports_http_api/esports_http_api.dart';
import 'package:esports_team_endpoint/core/core.dart';
import 'package:esports_team_endpoint/data/model/model.dart';
import 'package:hive/hive.dart';

part 'url_path.dart';
part 'datasource_box_name.dart';

part 'remote/team_image_logo_datasource.dart';
part 'remote/team_detail_datasource.dart';

part 'local/team_detail_local_datasource.dart';