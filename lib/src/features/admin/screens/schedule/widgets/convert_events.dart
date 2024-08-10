import 'package:balangoda_pulse/src/features/admin/screens/schedule/widgets/events_extracted.dart';

import '../../../models/community_event_model.dart';

List<EventsExtracted> communityEventModelsToEvents(List<CommunityEventModel> models) {
  return models.map((model) => EventsExtracted(
    title: model.name,
    date: model.dateTime,
    description: model.description
  )).toList();
}