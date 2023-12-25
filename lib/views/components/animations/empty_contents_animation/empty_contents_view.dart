import 'package:instagram_clone/views/components/animations/lottie_view.dart';
import '../models/lottie.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(animation: LottieAnimation.empty);
}
