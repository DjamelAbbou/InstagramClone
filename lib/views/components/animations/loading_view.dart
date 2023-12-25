import 'package:instagram_clone/views/components/animations/lottie_view.dart';
import './models/lottie.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
