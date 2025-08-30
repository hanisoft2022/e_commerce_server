part of 'server.dart';

Response _menuHandler(Request req, String mallType) {
  List<Map<String, Object>> storeMenuData;

  if (mallType == 'market') {
    storeMenuData = marketStoreMenu;
  } else {
    storeMenuData = beautyStoreMenu;
  }

  Map<String, dynamic> result = {
    'status': 'SUCCESS',
    'code': '0000',
    'message': '성공',
    'data': storeMenuData,
  };

  return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
}

Response _viewModuleHandler(Request request, String tabId, String page) {
  List<ViewModuleDto> viewModulesData;

  if (int.parse(page) >= 5) {
    viewModulesData = [];
  } else {
    viewModulesData = viewModules(tabId.startsWith('1', 0) ? 'market' : 'beauty');
  }

  Map<String, dynamic> result = {
    'status': 'SUCCESS',
    'code': '0000',
    'message': '성공',
    'data': viewModulesData,
  };
  return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
}
