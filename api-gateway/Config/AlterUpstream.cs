using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Api.Gateway.Config;

public class AlterUpstream
{
    public static string AlterUpstreamSwaggerJson(HttpContext _, string swaggerJson)
    {
        var swagger = JObject.Parse(swaggerJson);
        return swagger.ToString(Formatting.Indented);
    }
}
