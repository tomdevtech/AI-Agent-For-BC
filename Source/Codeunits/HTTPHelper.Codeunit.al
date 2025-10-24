codeunit 50105 "HTTP Helper"
{
    Access = Internal;

    /// <summary>
    /// Validates HTTP response status and throws appropriate errors.
    /// </summary>
    /// <param name="HttpResponseMessage">The HTTP response to validate</param>
    procedure ValidateHttpResponse(HttpResponseMessage: HttpResponseMessage)
    var
        StatusCode: Integer;
        ReasonPhrase: Text;
    begin
        StatusCode := HttpResponseMessage.HttpStatusCode();
        ReasonPhrase := HttpResponseMessage.ReasonPhrase();

        case StatusCode of
            200, 201, 202, 204:
                // Success - do nothing
                ;
            400:
                Error('Bad Request (400): %1. Please check your request format.', ReasonPhrase);
            401:
                Error('Unauthorized (401): %1. Please check your API key.', ReasonPhrase);
            403:
                Error('Forbidden (403): %1. Access denied.', ReasonPhrase);
            404:
                Error('Not Found (404): %1. API endpoint not found.', ReasonPhrase);
            429:
                Error('Too Many Requests (429): %1. Rate limit exceeded.', ReasonPhrase);
            500:
                Error('Internal Server Error (500): %1. Server error occurred.', ReasonPhrase);
            502:
                Error('Bad Gateway (502): %1. Server is temporarily unavailable.', ReasonPhrase);
            503:
                Error('Service Unavailable (503): %1. Service is temporarily unavailable.', ReasonPhrase);
            else
                Error('HTTP Error (%1): %2', StatusCode, ReasonPhrase);
        end;
    end;

    /// <summary>
    /// Checks if the HTTP response indicates success.
    /// </summary>
    /// <param name="HttpResponseMessage">The HTTP response to check</param>
    /// <returns>True if status code indicates success (200-299)</returns>
    procedure IsSuccessStatusCode(HttpResponseMessage: HttpResponseMessage): Boolean
    var
        StatusCode: Integer;
    begin
        StatusCode := HttpResponseMessage.HttpStatusCode();
        exit((StatusCode >= 200) and (StatusCode <= 299));
    end;

    /// <summary>
    /// Gets a user-friendly error message based on HTTP status code.
    /// </summary>
    /// <param name="StatusCode">The HTTP status code</param>
    /// <param name="ReasonPhrase">The reason phrase from the response</param>
    /// <returns>User-friendly error message</returns>
    procedure GetErrorMessage(StatusCode: Integer; ReasonPhrase: Text): Text
    begin
        case StatusCode of
            400:
                exit(StrSubstNo('Request format error (%1): %2', StatusCode, ReasonPhrase));
            401:
                exit(StrSubstNo('Authentication failed (%1): Please verify your API key', StatusCode));
            403:
                exit(StrSubstNo('Access denied (%1): %2', StatusCode, ReasonPhrase));
            404:
                exit(StrSubstNo('Service not found (%1): %2', StatusCode, ReasonPhrase));
            429:
                exit(StrSubstNo('Rate limit exceeded (%1): Please try again later', StatusCode));
            500 .. 599:
                exit(StrSubstNo('Server error (%1): %2', StatusCode, ReasonPhrase));
            else
                exit(StrSubstNo('HTTP error (%1): %2', StatusCode, ReasonPhrase));
        end;
    end;
}