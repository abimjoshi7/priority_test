part of '../routes.dart';

mixin AppRouter {
  MaterialPageRoute onGenerate(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case RouteRes.kHomePage:
            return HomePage();
          case RouteRes.kProductDetailPage:
            return ProductDetailPage();
          case RouteRes.kFilterPage:
            return FilterPage();
          case RouteRes.kReviewPage:
            return ReviewPage();
          case RouteRes.kCartPage:
            return CartPage(
              products: [],
            );
          case RouteRes.kOrderSummaryPage:
            return OrderSummaryPage();
          default:
            return _ErrorPage();
        }
      },
    );
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Page Not Found",
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "GO HOME",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
