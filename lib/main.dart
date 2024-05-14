import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_project/app_observer.dart';
import 'package:test_project/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:test_project/features/home/presentation/cubit/product_cubit.dart';
import 'package:test_project/features/review/presentation/cubit/review_cubit.dart';
import 'package:test_project/firebase_options.dart';

import 'di.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  const supabaseUrl = 'https://pbwxtxxroyigoqzasepb.supabase.co';
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBid3h0eHhyb3lpZ29xemFzZXBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU1ODA0MTAsImV4cCI6MjAzMTE1NjQxMH0.0tUVeUZggZ24vuhUiUuywziBRF1026lP1HtTDlPnDpc';

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  await locator.allReady();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<ProductCubit>()..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => locator<ReviewCubit>()..fetchReviews(),
        ),
        BlocProvider(
          create: (context) => locator<CartCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<CartCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
