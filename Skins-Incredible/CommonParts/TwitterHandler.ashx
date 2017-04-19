<%@ WebHandler Language="VB" Class="WebSitesCreative.Skins.Twitter.TwitterHandler" %>

Imports System.IO
Imports System.Net
Imports System.Security.Cryptography
Imports System.Text
Imports System.Web

Namespace WebSitesCreative.Skins.Twitter
    ''' <summary>
    ''' Summary description for TwitterHandler
    ''' </summary>
    Public Class TwitterHandler
        Implements IHttpHandler
        Public Sub ProcessRequest(context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "application/json"
            context.Response.Write(GetTimeline(context.Request("screen_name")))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

        Public Function GetTimeline(twitterHandle As String) As [String]
            ' oauth application keys
            Dim oauth_token = "66488438-NpDbde0yqlEUNpVTDzpV3knoGtUNnHWDP5fhRWoY"
            Dim oauth_token_secret = "XYLGwNRjqUWHAEuvLU0BBBVv41psdtlZFHM5nqcbKf8"
            Dim oauth_consumer_key = "XFrWOFcW61AWwzkZJdBoQ"
            Dim oauth_consumer_secret = "T2sQcb3ChoVaCUWWWa4U3uAhLLXYwZmWR2pdI97xg"

            ' oauth implementation details
            Dim oauth_version = "1.0"
            Dim oauth_signature_method = "HMAC-SHA1"

            ' unique request details
            Dim oauth_nonce = Convert.ToBase64String(New ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()))
            Dim timeSpan = DateTime.UtcNow - New DateTime(1970, 1, 1, 0, 0, 0, _
             0, DateTimeKind.Utc)
            Dim oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString()

            ' message api details
            Dim resource_url = "https://api.twitter.com/1.1/statuses/user_timeline.json"
            Dim screen_name = twitterHandle

            ' create oauth signature
            Dim baseFormat = "oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" & "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&screen_name={6}"

            Dim baseString = String.Format(baseFormat, oauth_consumer_key, oauth_nonce, oauth_signature_method, oauth_timestamp, oauth_token, _
             oauth_version, Uri.EscapeDataString(screen_name))

            baseString = String.Concat("GET&", Uri.EscapeDataString(resource_url), "&", Uri.EscapeDataString(baseString))

            Dim compositeKey = String.Concat(Uri.EscapeDataString(oauth_consumer_secret), "&", Uri.EscapeDataString(oauth_token_secret))

            Dim oauth_signature As String
            Using hasher As New HMACSHA1(ASCIIEncoding.ASCII.GetBytes(compositeKey))
                oauth_signature = Convert.ToBase64String(hasher.ComputeHash(ASCIIEncoding.ASCII.GetBytes(baseString)))
            End Using

            ' create the request header
            Dim headerFormat = "OAuth oauth_nonce=""{0}"", oauth_signature_method=""{1}"", " & "oauth_timestamp=""{2}"", oauth_consumer_key=""{3}"", " & "oauth_token=""{4}"", oauth_signature=""{5}"", " & "oauth_version=""{6}"""

            Dim authHeader = String.Format(headerFormat, Uri.EscapeDataString(oauth_nonce), Uri.EscapeDataString(oauth_signature_method), Uri.EscapeDataString(oauth_timestamp), Uri.EscapeDataString(oauth_consumer_key), Uri.EscapeDataString(oauth_token), _
             Uri.EscapeDataString(oauth_signature), Uri.EscapeDataString(oauth_version))


            ServicePointManager.Expect100Continue = False

            ' make the request
            Dim postBody = "screen_name=" & Uri.EscapeDataString(screen_name)
            resource_url += "?" & postBody
            Dim request As HttpWebRequest = DirectCast(WebRequest.Create(resource_url), HttpWebRequest)
            request.Headers.Add("Authorization", authHeader)
            request.Method = "GET"
            request.ContentType = "application/x-www-form-urlencoded"

            Using response As WebResponse = request.GetResponse()
               Using responseStream as Stream = response.GetResponseStream()
		  Using reader as StreamReader = New StreamReader(responseStream)
                     Return reader.ReadToEnd()
                  End Using
               End Using
            End Using
        End Function
    End Class
End Namespace