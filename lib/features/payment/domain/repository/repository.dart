import 'package:test_project/generics/base_methods.dart';

import '../domain.dart';

abstract class OrderRepository extends BaseMethods<Exception, Order> {}

abstract class OrderItemRepository extends BaseMethods<Exception, OrderItem> {}
