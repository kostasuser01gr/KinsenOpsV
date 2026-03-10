import 'package:flutter/material.dart';

class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final String moduleName;

  const ErrorBoundary({
    super.key,
    required this.child,
    required this.moduleName,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
    // Catch errors during build phase if possible, though Flutter usually 
    // catches build errors natively and replaces with ErrorWidget.
  }

  static void reportError(Object error, StackTrace stackTrace) {
    // In a real app, send to Sentry, Crashlytics, etc.
    debugPrint('ErrorBoundary Caught Error: $error\n$stackTrace');
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 64),
              const SizedBox(height: 16),
              Text(
                'Module Degraded: ${widget.moduleName}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const Text(
                'We encountered an issue loading this section. Please try again.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _error = null;
                    _stackTrace = null;
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return ErrorWidgetBuilder(
      builder: (context, error, stackTrace) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              _error = error;
              _stackTrace = stackTrace;
            });
            reportError(error, stackTrace);
          }
        });
        return const SizedBox.shrink(); // Placeholder while setting state
      },
      child: widget.child,
    );
  }
}

class ErrorWidgetBuilder extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext, Object, StackTrace) builder;

  const ErrorWidgetBuilder({
    super.key,
    required this.child,
    required this.builder,
  });

  @override
  State<ErrorWidgetBuilder> createState() => _ErrorWidgetBuilderState();
}

class _ErrorWidgetBuilderState extends State<ErrorWidgetBuilder> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return widget.builder(context, details.exception, details.stack ?? StackTrace.empty);
    };

    return widget.child;
  }
}
