import '../../domain/repositories/pre_order_repository.dart';
import '../../domain/entities/pre_order_entity.dart';
import '../models/pre_order_model.dart';
import '../datasources/pre_order_data_source.dart';
import '../../domain/failures/reservation_failure.dart';
import 'package:dartz/dartz.dart';

class PreOrderRepositoryImpl implements PreOrderRepository {
  final PreOrderDataSource dataSource;

  PreOrderRepositoryImpl(this.dataSource);

  @override
  Future<Either<PreOrderFailure, PreOrder>> createPreOrder(PreOrder preOrder) async {
    try {
      final model = PreOrderModel(
        id: preOrder.id,
        customerId: preOrder.customerId,
        restaurantId: preOrder.restaurantId,
        items: preOrder.items.map((item) => PreOrderItemModel(
          menuItemId: item.menuItemId,
          name: item.name,
          price: item.price,
          quantity: item.quantity,
          specialInstructions: item.specialInstructions,
        )).toList(),
        pickupTime: preOrder.pickupTime,
        status: preOrder.status,
        specialInstructions: preOrder.specialInstructions,
        createdAt: preOrder.createdAt,
        updatedAt: preOrder.updatedAt,
      );
      final result = await dataSource.createPreOrder(model);
      return Right(result);
    } catch (e) {
      return Left(PreOrderFailure.serverError());
    }
  }

  @override
  Future<Either<PreOrderFailure, PreOrder>> updatePreOrder(PreOrder preOrder) async {
    try {
      final model = PreOrderModel(
        id: preOrder.id,
        customerId: preOrder.customerId,
        restaurantId: preOrder.restaurantId,
        items: preOrder.items.map((item) => PreOrderItemModel(
          menuItemId: item.menuItemId,
          name: item.name,
          price: item.price,
          quantity: item.quantity,
          specialInstructions: item.specialInstructions,
        )).toList(),
        pickupTime: preOrder.pickupTime,
        status: preOrder.status,
        specialInstructions: preOrder.specialInstructions,
        createdAt: preOrder.createdAt,
        updatedAt: preOrder.updatedAt,
      );
      final result = await dataSource.updatePreOrder(model);
      return Right(result);
    } catch (e) {
      return Left(PreOrderFailure.serverError());
    }
  }

  @override
  Future<Either<PreOrderFailure, void>> deletePreOrder(String id) async {
    try {
      await dataSource.deletePreOrder(id);
      return const Right(null);
    } catch (e) {
      return Left(PreOrderFailure.serverError());
    }
  }

  @override
  Future<Either<PreOrderFailure, PreOrder>> getPreOrderById(String id) async {
    try {
      final result = await dataSource.getPreOrderById(id);
      return Right(result);
    } catch (e) {
      return Left(PreOrderFailure.notFound());
    }
  }

  @override
  Future<Either<PreOrderFailure, List<PreOrder>>> getPreOrdersByCustomerId(String customerId) async {
    try {
      final result = await dataSource.getPreOrdersByCustomerId(customerId);
      return Right(result);
    } catch (e) {
      return Left(PreOrderFailure.serverError());
    }
  }

  @override
  Future<Either<PreOrderFailure, List<PreOrder>>> getPreOrdersByRestaurantId(String restaurantId) async {
    try {
      final result = await dataSource.getPreOrdersByRestaurantId(restaurantId);
      return Right(result);
    } catch (e) {
      return Left(PreOrderFailure.serverError());
    }
  }

  @override
  Future<Either<PreOrderFailure, List<PreOrder>>> getPreOrdersByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final result = await dataSource.getPreOrdersByDateRange(
        restaurantId: restaurantId,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(result);
    } catch (e) {
      return Left(PreOrderFailure.serverError());
    }
  }
}