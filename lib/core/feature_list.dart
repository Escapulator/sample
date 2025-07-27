import 'feature_model.dart';

final feature = [
  {'title': 'Get help', 'subtitle': 'Contact support and resolve your issues'},
  {'title': 'Account information', 'subtitle': 'Update your personal details or securely close your account'},
  {'title': 'Privacy and security', 'subtitle': 'Manage your password 2-step verification, and biometrics.'},
  {
    'title': 'Preferences',
    'subtitle': 'Customize notifications and appearance settings to tailor your app experience.',
  },
  {'title': 'Connected accounts', 'subtitle': 'Manage your mobile money numbers and payments emails.'},
  {'title': 'About Yousend', 'subtitle': 'Access FAQs, terms and conditions, our blog, and contact options'},
];

List<FeatureModel> listFeature = List<FeatureModel>.from(feature.map((item) => FeatureModel.fromJson(item)));
