using tour_of_heroes_nuget;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();


app.MapGet("/", () =>
{
    // Create a Hero
    var hero = new Hero { Id = 1, Name = "Windstorm" };

    // Return the Hero
    return Results.Ok(hero);

});

app.Run();
