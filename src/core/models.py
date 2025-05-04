from django.db import models


# Create your models here.
class Actor(models.Model):
    name = models.CharField(max_length=100)
    age = models.IntegerField()

    def __str__(self):
        return self.name


class Movie(models.Model):
    title = models.CharField(max_length=100)
    release_date = models.DateField()
    actors = models.ManyToManyField(Actor, related_name="movies")

    def __str__(self):
        return self.title


class Review(models.Model):
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name="reviews")
    rating = models.IntegerField()
    comment = models.TextField()

    def __str__(self):
        return f"Review for {self.movie.title} - Rating: {self.rating}"
