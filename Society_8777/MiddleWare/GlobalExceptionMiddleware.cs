namespace Society_8777.MiddleWare
{
    public class GlobalExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<GlobalExceptionMiddleware> _logger;

        public GlobalExceptionMiddleware(
            RequestDelegate next,
            ILogger<GlobalExceptionMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                var path = context.Request.Path.ToString().Replace("\r", "").Replace("\n", "");
                _logger.LogError(ex,
                    "Unhandled error | TraceId: {TraceId} | Path: {Path}",
                    context.TraceIdentifier,
                    path);

                context.Response.StatusCode = StatusCodes.Status500InternalServerError;
                context.Response.ContentType = "application/json";

                await context.Response.WriteAsJsonAsync(new
                {
                    Message = "Internal Server Error",
                    TraceId = context.TraceIdentifier
                });
            }
        }
    }

}
