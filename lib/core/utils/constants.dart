import 'network/local/cache_helper.dart';

const kTransitionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const double kPadding = 16;
const kTestText =
    'Your childhood teacher did not wrong you when they taught you that there should be three, or four, or five sentences in a paragraph. It is important to understand, however, that the aim in teaching this was not to impart a hard-and-fast rule of grammar, drawn from an authoritative-but-dusty book. The true aim of this strategy was to teach you that your ideas must be well supported to be persuasive and effective.';
const double kMargin = 10;
const String kNetworkImage =
    'https://static-cse.canva.com/blob/666314/bestfreestockphotos.jpg';
const String kDefaultImage =
    'https://www.paperlessmovement.com/wp-content/uploads/2019/09/o2dvsv2pnhe.jpg';

dynamic kUID;
bool kIsEnglish = CacheHelper.getData(key: 'isEnglish') ?? true;
