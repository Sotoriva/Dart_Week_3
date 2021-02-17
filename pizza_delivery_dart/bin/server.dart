import 'dart:io';
import 'package:args/args.dart';
import 'package:dotenv/dotenv.dart' show load, env;
import 'package:pizza_delivery/application/routers/router_configure.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'package:pizza_delivery/application/config/database_connection_configuration.dart';
import 'package:pizza_delivery/application/config/service_locator_config.dart';
import 'package:pizza_delivery/application/middlewares/middlewares.dart';

// For Google Cloud Run, set _hostname to '0.0.0.0'.
const _hostname = '0.0.0.0';

void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  await loadConfigApplication();

  final appRouter = Router();

  RouterConfigure(appRouter).configure();

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware(cors())
      .addMiddleware(defaultResponseContentType('application/json;charset=utf-8'))
      .addHandler(appRouter);

  var server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}

Future<void> loadConfigApplication() async {
  await load();

  final databaseConfig = DatabaseConnectionConfiguration(
    host: Platform.environment['DATABASE_HOST'] ?? env['databaseHost'],
    user: Platform.environment['DATABASE_USER'] ?? env['databaseUser'],
    password: Platform.environment['DATABASE_PASSWORD'] ?? env['databasePassword'],
    port: Platform.environment['DATABASE_PORT'] ?? env['databasePort'],
    databaseName: Platform.environment['DATABASE_NAME'] ?? env['databaseName'],
  );

  GetIt.I.registerSingleton(databaseConfig);
  configureDependencies();
}
