using tour_of_heroes_nuget;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();


app.MapGet("/", () =>
{
    // Create a Hero
    var hero = new Hero { Id = 1, Name = "Windstorm" };

    // Return the Hero
    return Results.Ok(hero);

    // return Results.Ok("Hello World");

});

app.Run();
