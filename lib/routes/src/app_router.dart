part of '../routes.dart';

mixin AppRouter {
  MaterialPageRoute onGenerate(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case RouteRes.kHomePage:
            return const HomePage();
          case RouteRes.kProductDetailPage:
            return ProductDetailPage(
              id: routeSettings.arguments as int,
            );
          case RouteRes.kFilterPage:
            return const FilterPage();
          case RouteRes.kReviewPage:
            return ReviewPage(productId: routeSettings.arguments as int);
          case RouteRes.kCartPage:
            return const CartPage();
          case RouteRes.kOrderSummaryPage:
            return const OrderSummaryPage();
          default:
            return const _ErrorPage();
        }
      },
    );
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              "Page Not Found",
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "GO HOME",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
