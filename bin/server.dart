import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'dto/product_info_dto.dart';
import 'dto/view_module_dto.dart';

part 'data.dart';
part 'request.dart';

// // Configure routes.
// final _router = Router()
//   ..get('/', _rootHandler)
//   ..get('/echo/<message>', _echoHandler);

// Response _rootHandler(Request req) {
//   return Response.ok('Hello, World!\n');
// }

// Response _echoHandler(Request request) {
//   final message = request.params['message'];
//   return Response.ok('$message\n');
// }

// void main(List<String> args) async {
//   // Configure a pipeline that logs requests.
//   final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

//   // Use any available host or container IP (usually `0.0.0.0`).
//   final ip = InternetAddress.anyIPv4;

//   // For running in containers, we respect the PORT environment variable.
//   final port = int.parse(Platform.environment['PORT'] ?? '8080');
//   final server = await serve(handler, ip, port);
//   print('Server listening on port ${server.port}');
// }

final _router = Router()
  ..get('/api/menus/<mallType>', _menuHandler)
  ..get('/api/view_modules/<tabId>/<page>', _echoHandler);

void main(List<String> args) async {
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router.call);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, '127.0.0.1', port);
  print('Server listening on port ${server.port}');
}
