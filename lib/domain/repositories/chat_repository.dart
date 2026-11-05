import '../entities/chat_entities.dart';

abstract class ChatRepository {
  Future<List<ChatConversation>> getConversations();
  Future<List<ChatMessage>> getMessages(String conversationId);
  Future<void> sendMessage(ChatMessage message);
  Future<ContractOffer?> getContractOffer(String contractId);
  Future<void> createContractOffer(ContractOffer offer);
  Future<void> updateContractStatus(String contractId, String status);
}
