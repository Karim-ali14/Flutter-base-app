
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/domain/providers/user_provider.dart';
import '../network/http_operation.dart';

final httpOperationsProvider = Provider<HttpOperations>((ref)  {
  return HttpOperations(ref);
});