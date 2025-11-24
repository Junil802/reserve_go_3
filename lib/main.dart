import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reserve_go_1/features/order/data/datasources/order_remote_data_source.dart';
import 'package:reserve_go_1/features/order/data/repositories/order_repository_impl.dart' as data_repo;
import 'package:reserve_go_1/features/order/domain/repositories/order_repository.dart' as domain_repo;

void main() {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final OrderRemoteDataSource remoteDataSource =
      OrderRemoteDataSourceImpl(firestore: firestore);

  final domain_repo.OrderRepository orderRepository =
      data_repo.OrderRepositoryImpl(remoteDataSource);

  runApp(MyApp(orderRepository: orderRepository));
}

class MyApp extends StatelessWidget {
  final domain_repo.OrderRepository orderRepository;

  const MyApp({super.key, required this.orderRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserve Go',
      home: MyHomePage(orderRepository: orderRepository),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final domain_repo.OrderRepository orderRepository;

  const MyHomePage({super.key, required this.orderRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reserve Go')),
      body: Center(
        child: Text('Home Page with Order Repository'),
      ),
    );
  }
}
