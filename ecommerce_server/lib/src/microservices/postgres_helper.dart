import 'package:postgres_pool/postgres_pool.dart';

class PostgresHelper {
  static final PostgresHelper _instance = PostgresHelper._internal();

  late final PgPool _pool;

  factory PostgresHelper() {
    return _instance;
  }

  PostgresHelper._internal() {
    _pool = PgPool(
      PgEndpoint(
        host: 'localhost',
        database: 'ecommerce',
        port: 8090,
        username: 'postgres',
        password: '2tM_9zARtmy4bevnELmQdAN6V0ZwXZ32',
      ),
      settings: PgPoolSettings(),
    );
  }

  PgPool getPool() {
    return _pool;
  }
}
