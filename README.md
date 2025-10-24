# 🤖 AI-Agent-For-BC

This project demonstrates how to integrate various AI services—such as **GitHub Copilot**, **Ollama**, and **OpenRouter** into Microsoft Dynamics 365 Business Central using AL interfaces.

## 🚀 Project Overview

- **Modular Architecture:** AI services are connected via AL interfaces, making it easy to add or swap providers.
- **Flexible Integration:** Interfaces ensure loose coupling between Business Central and external AI solutions.
- **Use Case:** Currently focused on intelligent chatbots, allowing users to interact with AI models directly within Business Central.

## 💬 Chatbot Functionality

- **Model Switching:** Users can switch between activated AI models (Copilot, Ollama, OpenRouter) directly in the PromptDialog, enabling flexible conversations and testing different model responses.
- **System Role Configuration:** The system role (e.g., assistant, expert, etc.) for each AI service can be customized in the setup, tailoring the chatbot's behavior and responses to specific business needs.

## 🛠️ AI Services Used

- **GitHub Copilot:** AI-powered code completion and developer assistance.
- **Ollama:** Local AI models for fast and privacy-friendly analysis.
- **OpenRouter:** Unified API for accessing multiple AI models and providers.

## 📦 Features

- **AL Interface Definitions:** Standardized interfaces for communication with AI services.
- **Sample Implementations:** Example code for connecting Copilot, Ollama, and OpenRouter.
- **Best Practices:** Guidance on security, compliance, and maintainability.

## 📝 Getting Started

1. Clone the repository.
2. Review and configure the AL interfaces.
3. Connect your preferred AI service.
4. Deploy and test in your Business Central environment.

## 🔗 Helpful Links

- [Best Practices for AL Code (Microsoft Docs)](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/compliance/apptest-bestpracticesforalcode)
- [Business Central AL Language Reference](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-reference-for-al)
- [Ollama Documentation](https://ollama.com/docs)
- [OpenRouter API Docs](https://openrouter.ai/docs)
- [GitHub Copilot Information](https://github.com/features/copilot)
- [Working with HTTPClient in BC](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-httpclient)
- [Prompt Dialog Window in BC](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-page-type-promptdialog)
