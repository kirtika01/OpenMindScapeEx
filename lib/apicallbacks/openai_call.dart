import 'package:dart_openai/dart_openai.dart';

Future<OpenAIChatCompletionModel?> callChatGPT(String prompt) async {
  try {
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      // model: "gpt-4",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: prompt,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
    return chatCompletion;
  } catch (e) {
    print(e.toString());
  }
  return null;
}

Future<Map?> getModels() async {
  List<OpenAIModelModel> models = await OpenAI.instance.model.list();

  for (final mdl in models) {
    print(mdl.id);
  }
}

Future<OpenAIImageModel?> generateImage(String prompt) async {
  try {
    OpenAIImageModel image = await OpenAI.instance.image.create(
      prompt: prompt,
      n: 1,
      size: OpenAIImageSize.size512,
      responseFormat: OpenAIImageResponseFormat.url,
    );
    print(image);
    return image;
  } catch (e) {
    print(e.toString());
  }
  return null;
}