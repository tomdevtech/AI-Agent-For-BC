enum 50101 "AI Implementation" implements IAImplementation
{
    Extensible = true;

    value(0; "Copilot")
    {
        Caption = 'Copilot';
        Implementation = IAImplementation = "Copilot Implementation";
    }

    value(1; "Ollama")
    {
        Caption = 'Ollama';
        Implementation = IAImplementation = "Ollama Implementation";
    }

    value(2; "OpenRouter")
    {
        Caption = 'OpenRouter';
        Implementation = IAImplementation = "OpenRouter Implementation";
    }
}