using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Society_8777.CommonLogic;
using Society_8777.DataBaseContext;
using Society_8777.Interface;
using Society_8777.Models;
using Society_8777.Repository;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
var sqlcon = builder.Configuration.GetConnectionString("Con");

builder.Services.AddDbContext<DataBaseContext>
(options => options.UseSqlServer(CommomFunction.Encrypt_Dycrypt_Bank.DecryptString(sqlcon)));

builder.Services.AddTransient<Token>();

builder.Services.AddTransient<ISocietyUser, SocietyUserRepository>();
builder.Services.AddTransient<IFlat, FlatRepo>();
builder.Services.AddTransient<IGuest, GuestRepo>();
builder.Services.AddTransient<IPark, ParkRepo>();
builder.Services.AddTransient<IInc, INCRepo>();
builder.Services.AddTransient<IFireBaseNotification, FirebaseNotificationService>();
builder.Services.AddTransient<IErrorLog, ErrorLogRepo>();
builder.Services.AddTransient<IFCMToken, FCMTokenRepo>();


// Add services to the container.

builder.Services.AddControllers();


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))

        };


    });
builder.Services.AddSwaggerGen(c =>
{


    OpenApiSecurityScheme securityDefinition = new OpenApiSecurityScheme()
    {
        Name = "Bearer",
        BearerFormat = "JWT",
        Scheme = "bearer",
        Description = "this token generation is for security purpose",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
    };
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = "JWT Authorization header using the Bearer scheme. Example :\"Bearer {token}\"",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT"


    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement

     {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                   Type = ReferenceType.SecurityScheme,
                   Id="Bearer"
                }
            },
            Array.Empty<string>()

        }

    });
    //c.OperationFilter<AddRequiredHeaders>();
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "Dev",
        Title = "Society 8777 API",
        Description = "Society7 API for Swagger integration",
        TermsOfService = new Uri("http://sbank7.somee.com/"), // Add url of term of service details
        Contact = new OpenApiContact
        {
            Name = "Society7 Web Application",
            Url = new Uri("http://sbank7.somee.com/") // Add url of contact details
        },
        License = new OpenApiLicense
        {
            Name = "Society7 License",
            Url = new Uri("http://sbank7.somee.com/") // Add url of license details
        }
    });
}
    );
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        policy => policy.AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader());
});


var app = builder.Build();
app.UseCors("AllowAll");
app.MapSwagger();
app.UseSwagger();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment() || app.Environment.IsProduction())
{

    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseStaticFiles(); // For wwwroot

// Serve files from Images folder
var imagePath = Path.Combine(Directory.GetCurrentDirectory(), "Images");

if (Directory.Exists(imagePath))
{
    app.UseStaticFiles(new StaticFileOptions
    {
        FileProvider = new PhysicalFileProvider(imagePath),
        RequestPath = "/Images"
    });
}
else
{
    Console.WriteLine($"[ERROR] Images directory not found at {imagePath}");
}


app.UseAuthorization();
//app.UseMiddleware<ApiKeyMiddleware>();
app.MapControllers();

app.Run();
