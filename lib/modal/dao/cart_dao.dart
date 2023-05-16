// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:furniture_shoping/modal/entity/cart_entity.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM Cart')
  Future<List<Cart>> findAllCarts();

  @Query('SELECT * FROM Cart WHERE id = :id')
  Stream<Cart?> findCartById(int id);

  @Query('DELETE FROM Cart WHERE id = :id')
  Future<void> deleteById(int id);

  @insert
  Future<void> insertCart(Cart cart);

  @Query('UPDATE Cart SET cartProductOty = :cartProductOty  WHERE id = :id')
  Future<Cart?> updateQty(int cartProductOty,int id);

}