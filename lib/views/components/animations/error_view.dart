import 'package:instagram_clone/views/components/animations/lottie_view.dart';
import './models/lottie.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}
