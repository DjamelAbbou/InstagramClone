import 'package:instagram_clone/views/components/animations/lottie_view.dart';
import './models/lottie.dart';

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.smallError,
        );
}
