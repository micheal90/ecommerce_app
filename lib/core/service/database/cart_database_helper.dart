import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;

  Future get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'cartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct (
         $columnName TEXT NOT NULL,
         $columnImageUrl TEXT NOT NULL,
         $columnPrice TEXT NOT NULL,
         $columnQuantity INTEGER NOT NULL,
         $columnProductId TEXT NOT NULL)
          ''');
    });
  }

  insert(CartProductModel model) async {
    Database dbClient = await database;

    await dbClient.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProducts() async {
    Database dbClient = await database;
    List<Map> products = await dbClient.query(tableCartProduct);
    return products.isNotEmpty
        ? products.map((product) => CartProductModel.fromjson(product)).toList()
        : [];
  }

  updateProduct(CartProductModel model) async {
    Database dbClient = await database;
    await dbClient.update(tableCartProduct, model.toJson(),
        where: '$columnProductId = ?', whereArgs: [model.productId]);
  }

  Future removeProduct(int id) async {
    Database dbClient = await database;
    dbClient.delete(tableCartProduct,
        where: '$columnProductId = ?', whereArgs: [id]);
  }

  deleteTable() async {
    Database dbClient = await database;
    dbClient.delete(tableCartProduct);
  }
}
