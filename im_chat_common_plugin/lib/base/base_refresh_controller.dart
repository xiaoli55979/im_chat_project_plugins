import 'package:easy_refresh/easy_refresh.dart';
import 'package:im_chat_common_plugin/base/base_controller.dart';
import 'package:im_chat_common_plugin/util/page_helper.dart';

class BaseRefreshController extends BaseController {

  final _refreshController = EasyRefreshController();

  EasyRefreshController get refreshController => _refreshController;

  final _pageHelper = PageHelper();

  PageHelper get pageHelper => _pageHelper;

}
