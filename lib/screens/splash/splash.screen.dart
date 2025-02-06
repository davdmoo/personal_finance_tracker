import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../routes.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(context.read<AppDatabase>())..add(SplashEvent.started()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SplashBloc, SplashState>(
            listenWhen: (previous, current) => previous.appInitSuccessful != current.appInitSuccessful,
            listener: (context, state) {
              final appInitSuccessful = state.appInitSuccessful;
              if (!appInitSuccessful) return;

              HomeRoute().go(context);
            },
          ),
        ],
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: BlocBuilder<SplashBloc, SplashState>(
              buildWhen: (previous, current) {
                return previous.isLoading != current.isLoading || previous.error != current.error;
              },
              builder: (context, state) {
                final isLoading = state.isLoading;
                if (isLoading) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      CircularProgressIndicator(),
                      Text("Initiating app.."),
                    ],
                  );
                }

                final error = state.error;
                if (error != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(error.toString()),
                      ElevatedButton(
                        onPressed: () => context.read<SplashBloc>().add(SplashEvent.started()),
                        child: Text("Retry"),
                      ),
                    ],
                  );
                }

                return Center(
                  child: Text(
                    "App init successful.\nRedirecting..",
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
