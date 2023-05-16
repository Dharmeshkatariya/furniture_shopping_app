// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao? _personDaoInstance;

  ProductDao? _productDaoInstance;

  CartDao? _cartDaoInstance;

  AddressDao? _addressDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 4,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product` (`id` INTEGER NOT NULL, `productName` TEXT NOT NULL, `productImage` TEXT NOT NULL, `productPrice` REAL NOT NULL, `productQty` INTEGER NOT NULL, `isSelect` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Cart` (`id` INTEGER NOT NULL, `cartProductName` TEXT NOT NULL, `cartProductPrice` REAL NOT NULL, `cartProductImage` TEXT NOT NULL, `cartProductOty` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Address` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `address` TEXT NOT NULL, `zipcode` INTEGER NOT NULL, `country` TEXT NOT NULL, `city` TEXT NOT NULL, `district` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }

  @override
  AddressDao get addressDao {
    return _addressDaoInstance ??= _$AddressDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) =>
            Person(row['id'] as int, row['name'] as String));
  }

  @override
  Stream<Person?> findPersonById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Person(row['id'] as int, row['name'] as String),
        arguments: [id],
        queryableName: 'Person',
        isView: false);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Person WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'Product',
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'productName': item.productName,
                  'productImage': item.productImage,
                  'productPrice': item.productPrice,
                  'productQty': item.productQty,
                  'isSelect': item.isSelect ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  @override
  Future<List<Product>> findAllProduct() async {
    return _queryAdapter.queryList('SELECT * FROM Product',
        mapper: (Map<String, Object?> row) => Product(
            row['id'] as int,
            row['productName'] as String,
            row['productImage'] as String,
            row['productPrice'] as double,
            row['productQty'] as int,
            (row['isSelect'] as int) != 0));
  }

  @override
  Future<Product?> findProductById(int id) async {
    return _queryAdapter.query('SELECT * FROM Product WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Product(
            row['id'] as int,
            row['productName'] as String,
            row['productImage'] as String,
            row['productPrice'] as double,
            row['productQty'] as int,
            (row['isSelect'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Product WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<int> insertProduct(Product product) {
    return _productInsertionAdapter.insertAndReturnId(
        product, OnConflictStrategy.abort);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _cartInsertionAdapter = InsertionAdapter(
            database,
            'Cart',
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'cartProductName': item.cartProductName,
                  'cartProductPrice': item.cartProductPrice,
                  'cartProductImage': item.cartProductImage,
                  'cartProductOty': item.cartProductOty
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cart> _cartInsertionAdapter;

  @override
  Future<List<Cart>> findAllCarts() async {
    return _queryAdapter.queryList('SELECT * FROM Cart',
        mapper: (Map<String, Object?> row) => Cart(
            row['id'] as int,
            row['cartProductName'] as String,
            row['cartProductPrice'] as double,
            row['cartProductImage'] as String,
            row['cartProductOty'] as int));
  }

  @override
  Stream<Cart?> findCartById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Cart WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Cart(
            row['id'] as int,
            row['cartProductName'] as String,
            row['cartProductPrice'] as double,
            row['cartProductImage'] as String,
            row['cartProductOty'] as int),
        arguments: [id],
        queryableName: 'Cart',
        isView: false);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Cart WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<Cart?> updateQty(
    int cartProductOty,
    int id,
  ) async {
    return _queryAdapter.query(
        'UPDATE Cart SET cartProductOty = ?1  WHERE id = ?2',
        mapper: (Map<String, Object?> row) => Cart(
            row['id'] as int,
            row['cartProductName'] as String,
            row['cartProductPrice'] as double,
            row['cartProductImage'] as String,
            row['cartProductOty'] as int),
        arguments: [cartProductOty, id]);
  }

  @override
  Future<void> insertCart(Cart cart) async {
    await _cartInsertionAdapter.insert(cart, OnConflictStrategy.abort);
  }
}

class _$AddressDao extends AddressDao {
  _$AddressDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _addressInsertionAdapter = InsertionAdapter(
            database,
            'Address',
            (Address item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'address': item.address,
                  'zipcode': item.zipcode,
                  'country': item.country,
                  'city': item.city,
                  'district': item.district
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Address> _addressInsertionAdapter;

  @override
  Future<List<Address>> findAllAddress() async {
    return _queryAdapter.queryList('SELECT * FROM Address',
        mapper: (Map<String, Object?> row) => Address(
            row['id'] as int,
            row['name'] as String,
            row['address'] as String,
            row['zipcode'] as int,
            row['country'] as String,
            row['city'] as String,
            row['district'] as String));
  }

  @override
  Stream<Address?> findAddressById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Address WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Address(
            row['id'] as int,
            row['name'] as String,
            row['address'] as String,
            row['zipcode'] as int,
            row['country'] as String,
            row['city'] as String,
            row['district'] as String),
        arguments: [id],
        queryableName: 'Address',
        isView: false);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Address WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertAddress(Address Address) async {
    await _addressInsertionAdapter.insert(Address, OnConflictStrategy.abort);
  }
}
